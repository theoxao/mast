import _thread
import asyncio
import time

import websockets as ws
from threading import Thread


async def send_msg(websocket, msg, delay):
    while True:
        await asyncio.sleep(delay)
        await websocket.send(msg)
        recv = await websocket.recv()
        print(f"{recv}")


async def prepare():
    async with ws.connect("ws://localhost:8080/myws/echo") as websocket:
        await send_msg(websocket, time.time().__str__(), 1)


async def another():
    async with ws.connect("ws://localhost:8080/another") as websocket:
        await send_msg(websocket, "i am ok ", 5)


def start_1():
    asyncio.new_event_loop().run_until_complete(prepare()), ("prepare", 2,)


def start_2():
    asyncio.new_event_loop().run_until_complete(another()), ("another", 2,)


if __name__ == '__main__':
    Thread(target=start_1).start()
    Thread(target=start_2).start()

    while True:
        pass

