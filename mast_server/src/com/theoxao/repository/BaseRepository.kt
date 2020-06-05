package com.theoxao.repository

import me.liuwj.ktorm.database.*
import me.liuwj.ktorm.entity.*
import me.liuwj.ktorm.schema.*

/**
 * @author theo
 * @date 2020/6/1
 */
abstract class BaseRepository() {

    abstract var db: Database

    fun <E : Any ,T: BaseTable<E>> seq(table: T): EntitySequence<E, BaseTable<E>>{
        return db.sequenceOf(table)
    }

    inline fun <  E : Any, reified T : BaseTable<E>>  findAll(table:T): List<E> {
        return seq(table).toList()
    }



}
