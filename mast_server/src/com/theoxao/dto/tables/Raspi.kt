package com.theoxao.dto.tables

import com.theoxao.dto.entities.*
import me.liuwj.ktorm.schema.*

/**
 * @author theo
 * @date 2020/5/28
 */
object RASPI_STATE : Table<RaspiState>("raspi_state") {
    val id by long("id").primaryKey().bindTo { it.id }
    val freeMem by varchar("free_mem").bindTo { it.freeMem }
    val channelState by long("channel_state").bindTo { it.channelState }
    val deviceState by long("device_state").bindTo { it.deviceState }
    val createTime by datetime("create_time").bindTo { it.createTime }
}


