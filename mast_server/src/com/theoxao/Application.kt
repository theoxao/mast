package com.theoxao

import com.fasterxml.jackson.databind.*
import com.theoxao.service.*
import io.ktor.application.*
import io.ktor.features.*
import io.ktor.http.*
import io.ktor.http.cio.websocket.*
import io.ktor.jackson.*
import io.ktor.response.*
import io.ktor.routing.*
import io.ktor.websocket.*
import org.kodein.di.*
import org.kodein.di.generic.*
import java.time.*

fun main(args: Array<String>) =io.ktor.server.netty.EngineMain.main(args)

val koin = Kodein{
    bind<RaspiService>() with singleton { RaspiService() }
    bind<ObjectMapper>() with provider { ObjectMapper() }
}

@Suppress("unused") // Referenced in application.conf
@kotlin.jvm.JvmOverloads
fun Application.module(testing: Boolean = false) {
    install(io.ktor.websocket.WebSockets) {
        pingPeriod = Duration.ofSeconds(15)
        timeout = Duration.ofSeconds(15)
        maxFrameSize = Long.MAX_VALUE
        masking = false
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

