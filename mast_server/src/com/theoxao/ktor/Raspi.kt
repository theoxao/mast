package com.theoxao.ktor

import com.theoxao.*
import com.theoxao.service.*
import io.ktor.application.*
import io.ktor.http.cio.websocket.*
import io.ktor.routing.*
import io.ktor.websocket.*
import org.kodein.di.generic.*

/**
 * @author theo
 * @date 2020/5/26
 */


fun Application.raspi() {

    val raspiService: RaspiService by koin.instance<RaspiService>()

    routing {
        route("/raspi") {
            webSocket("/beat") {
                while (true) {
                    val frame = incoming.receive()
                    if (frame is Frame.Text) {
                        val data = frame.readText()
                        raspiService.heartBeat(data)
                        send(Frame.Text(configLastUpdateTime.toString()))
                    }
                }
            }
        }
    }

}
