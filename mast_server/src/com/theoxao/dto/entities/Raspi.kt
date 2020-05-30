package com.theoxao.dto.entities

import com.theoxao.dto.tables.*
import com.theoxao.dto.tables.RASPI_STATE.primaryKey
import me.liuwj.ktorm.entity.*
import me.liuwj.ktorm.schema.*
import java.time.*

/**
 * @author theo
 * @date 2020/5/29
 */

interface RaspiState:Entity<RaspiState>{
    val id :Long
    val freeMem : String
    val channelState:Long
    val deviceState:Long
    val createTime :LocalDateTime
}
