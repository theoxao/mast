package com.theoxao.config

import io.ktor.application.*
import io.ktor.util.*
import me.liuwj.ktorm.database.*
import me.liuwj.ktorm.support.sqlite.*

/**
 * @author theo
 * @date 2020/5/28
 */
class Sqlite(val holder: ConnectionHolder) {

    companion object Feature : ApplicationFeature<Application, ConnectionHolder, Sqlite> {
        override val key: AttributeKey<Sqlite>
            get() = AttributeKey("sqlite3")

        override fun install(pipeline: Application, configure: ConnectionHolder.() -> Unit): Sqlite {
            val holder = ConnectionHolder().apply(configure)
            return Sqlite(holder)
        }

    }

}


class ConnectionHolder {

    lateinit var db: Database

    @KtorExperimentalAPI
    fun Application.sqlite(property: String = "database.sqlite") {
        db = Database.connect(
                url = this.environment.config.property("$property.url").getString(),
                driver = "org.sqlite.JDBC",
                user = this.environment.config.property("$property.username").getString(),
                password = this.environment.config.property("$property.password").getString(),
                dialect = SQLiteDialect()
        )
    }

}
