package com.theoxao.dto.entities

import me.liuwj.ktorm.entity.*

/**
 * @author theo
 * @date 2020/5/30
 */

interface Cell : Entity<Cell> {
    companion object : Entity.Factory<Cell>()

    val id: Int
    val name: String
    val desc: String
    val room: Room

    val type: String
    val icon: String
    val group: Group?
    val switch: Param?
    var params: List<Param>?

}

interface Room : Entity<Room> {
    companion object : Entity.Factory<Room>()
    val id: Int
    val name: String
    val image:String
    var cells: List<Cell>?
}

interface Param : Entity<Param> {
    companion object : Entity.Factory<Param>()

    val id: Int
    val type: String
    val desc: String
    val key: String
    val options: String
    val value: String
    val editable: Int
    val cellId: Int
}


interface Group : Entity<Group> {
    companion object : Entity.Factory<Group>()

    val id: Int
    val name: String
}
