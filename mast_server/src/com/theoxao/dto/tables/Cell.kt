package com.theoxao.dto.tables

import com.theoxao.dto.entities.*
import me.liuwj.ktorm.schema.*

/**
 * @author theo
 * @date 2020/5/30
 */

open class CELL(alias: String?) : Table<Cell>("cell", alias) {

    override fun aliased(alias: String) = CELL(alias)

    companion object : CELL(null)

    val id by int("id").primaryKey().bindTo { it.id }
    val name by varchar("name").bindTo { it.name }
    val desc by text("desc").bindTo { it.desc }
    val type by varchar("type").bindTo { it.type }
    val icon by text("icon").bindTo { it.icon }
    val roomId by int("room_id").references(ROOM) { it.room }
    val groupId by int("group_id").references(GROUP) { it.group }
    val switchId by int("switch_id").references(PARAM) { it.switch }
}


open class ROOM(alias: String?) : Table<Room>("room", alias) {
    override fun aliased(alias: String) = ROOM(alias)
    companion object : ROOM(null)
    val id by int("id").primaryKey().bindTo { it.id }
    val name by varchar("name").bindTo { it.name }
    val image by  varchar("image").bindTo { it.image }
}

open class PARAM(alias: String?) : Table<Param>("param", alias) {
    override fun aliased(alias: String) = PARAM(alias)

    companion object : PARAM(null)

    val id by int("id").primaryKey().bindTo { it.id }
    val type by varchar("type").bindTo { it.type }
    val key by varchar("key").bindTo { it.key }
    val desc by varchar("desc").bindTo { it.desc }
    val options by text("options").bindTo { it.options }
    val value by varchar("value").bindTo { it.value }
    val editable by int("editable").bindTo { it.editable }
    val cellId by int("cell_id").bindTo { it.cellId }

}


open class GROUP(alias: String?) : Table<Group>("group", alias) {
    override fun aliased(alias: String) = GROUP(alias)

    companion object : GROUP(null)

    val id by int("id").primaryKey().bindTo { it.id }
    val name by varchar("name").bindTo { it.name }
}

