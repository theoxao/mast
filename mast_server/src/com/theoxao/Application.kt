package com.theoxao

import com.fasterxml.jackson.core.*
import com.fasterxml.jackson.databind.*
import com.theoxao.config.*
import com.theoxao.repository.*
import com.theoxao.service.*
import io.ktor.application.*
import io.ktor.features.*
import io.ktor.http.*
import io.ktor.http.cio.websocket.*
import io.ktor.jackson.*
import io.ktor.response.*
import io.ktor.routing.*
import io.ktor.util.*
import io.ktor.websocket.*
import me.liuwj.ktorm.jackson.*
import org.koin.dsl.*
import org.koin.ktor.ext.*
import java.time.*

fun main(args: Array<String>) = io.ktor.server.netty.EngineMain.main(args)

@KtorExperimentalAPI
@Suppress("unused") // Referenced in application.conf
@kotlin.jvm.JvmOverloads
fun Application.init(testing: Boolean = false) {
    install(WebSockets) {
        pingPeriod = Duration.ofSeconds(15)
        timeout = Duration.ofSeconds(15)
        maxFrameSize = Long.MAX_VALUE
        masking = false
    }

    val sqlite = install(Sqlite) {
        sqlite()
    }
    val db = sqlite.holder.db
    val objectMapper = ObjectMapper()
    objectMapper.registerModule(KtormModule())
    objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES,  true)
    objectMapper.configure(JsonParser.Feature.IGNORE_UNDEFINED , true)
    install(Koin) {
        modules(
                module {
                    single { db }
                    single { objectMapper }
                    single { RaspiRepository(get()) }
                    single { RaspiService() }
                }
        )
    }

    install(ContentNegotiation) {
        jackson {
            enable(SerializationFeature.INDENT_OUTPUT)
        }
    }

    routing {
        get("/") {
            call.respondText("HELLO WORLD!", contentType = ContentType.Text.Plain)
        }
    }
}

