package com.theoxao.service

import com.fasterxml.jackson.databind.*
import com.theoxao.*
import org.kodein.di.generic.*

/**
 * @author theo
 * @date 2020/5/26
 */
class RaspiService {

    val objectMapper by koin.instance<ObjectMapper>()

    fun heartBeat(data: String) {
        val state = objectMapper.readValue(data, RaspiState::class.java)
    }

}
