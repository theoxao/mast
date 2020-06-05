package com.theoxao.ktor

import com.theoxao.dto.entities.*
import com.theoxao.service.*
import io.ktor.application.*
import io.ktor.request.*
import io.ktor.response.*
import io.ktor.routing.*
import org.koin.ktor.ext.*

/**
 * @author theo
 * @date 2020/5/30
 */

fun Application.backend(){

val cellService:CellService by inject()

    routing {
        route("/backend"){
            get("/cell_list"){
                val list = cellService.listCells()
                call.respond(list)
            }

            post("/create_cell"){
               val cell =  call.receive(Cell::class)
                cellService.create(cell)
            }
        }
    }

}
