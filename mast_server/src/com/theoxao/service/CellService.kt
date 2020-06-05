package com.theoxao.service

import com.theoxao.dto.entities.*
import com.theoxao.dto.tables.*
import com.theoxao.repository.*
import org.koin.core.*

/**
 * @author theo
 * @date 2020/5/30
 */
class CellService : KoinComponent {

    private val cellRepository: CellRepository by inject()

    fun listCells(): List<Cell> {
        val all = cellRepository.findAll(CELL)
        val paramMap = cellRepository.findParams(all.map(Cell::id))
        all.forEach {
            it.params = paramMap[it.id]
        }
        return all
    }

    fun create(cell: Cell) {
        cellRepository.save(cell)
    }

    fun listRooms(): List<Room> {
        val rooms = cellRepository.findAll(ROOM)
        val cellMap = cellRepository.findCells(rooms.map(Room::id))
        rooms.forEach {
            it.cells = cellMap[it.id]
        }
        return rooms
    }

}
