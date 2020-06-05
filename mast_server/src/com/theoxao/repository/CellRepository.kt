package com.theoxao.repository

import com.theoxao.dto.entities.*
import com.theoxao.dto.tables.*
import me.liuwj.ktorm.database.*
import me.liuwj.ktorm.dsl.*
import me.liuwj.ktorm.entity.*

/**
 * @author theo
 * @date 2020/5/30
 */
open class CellRepository(override var db: Database) : BaseRepository() {

    fun save(cell: Cell) {
        db.sequenceOf(CELL).add(cell)
    }

    fun listCells(): List<Cell> {
        return db.sequenceOf(CELL,false).toList()
    }

    fun findParams(ids: List<Int>): Map<Int, List<Param>> {
        return db.sequenceOf(PARAM).filter { it.cellId inList ids}.groupBy(Param::cellId)
    }

    fun findCells(ids: List<Int>): Map<Int, List<Cell>> {
        return db.sequenceOf(CELL).filter { it.roomId inList  ids } .groupBy{it.room.id}
    }

}
