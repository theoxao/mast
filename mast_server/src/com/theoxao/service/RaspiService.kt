package com.theoxao.service

import com.fasterxml.jackson.databind.*
import com.theoxao.dto.entities.*
import com.theoxao.repository.*
import com.theoxao.share.*
import org.koin.core.*

/**
 * @author theo
 * @date 2020/5/26
 */
class RaspiService : KoinComponent {

    private val objectMapper: ObjectMapper by inject()
    private val raspiRepository: RaspiRepository by inject()


    fun heartBeat(data: String) {
        val state = objectMapper.readValue(data, RaspiState::class.java)
        currentState = state.channelState
        recentReportTime = System.currentTimeMillis()
    }

}
