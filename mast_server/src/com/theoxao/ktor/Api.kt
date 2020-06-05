package com.theoxao.ktor

import com.theoxao.service.*
import com.theoxao.share.*
import io.ktor.application.*
import io.ktor.http.cio.websocket.*
import io.ktor.response.*
import io.ktor.routing.*
import io.ktor.websocket.*
import kotlinx.coroutines.*
import org.koin.ktor.ext.*

/**
 * @author theo
 * @date 2020/5/29
 */

var flush = false

fun Application.api() {

    val cellService :CellService by inject()

    routing {
        route("/api") {
            webSocket("/check_state") {
                while (true) {
                    val frame = incoming.receive()
                    if (frame is Frame.Text) {
                        val timestamp = frame.readText().toLong()
                        while (timestamp > recentReportTime) {
                            delay(100)
                        }
                        send(Frame.Text(currentState.toString()))
                    }
                }
            }

            get("/cells"){
                call.respond(cellService.listCells())
            }

            get("/rooms"){
                call.respond(cellService.listRooms())
            }

        }
    }
}
