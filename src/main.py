import os
import asyncio
from telethon import TelegramClient, functions

api_id = int(os.getenv('API_ID'))
api_hash = os.getenv('API_HASH')
phone_number = os.getenv('PHONE_NUMBER')

if not all([api_id, api_hash, phone_number]):
    raise ValueError("Необходимые переменные окружения API_ID, API_HASH и BOT_TOKEN не установлены.")

channel_name = 'няняня'
channel_about = 'о няняняня'
post_text = 'Привет мир'
image_path = './pic.jpg'
link_url = 'some-shit.com'

client = TelegramClient('client', api_id, api_hash).start(phone=phone_number, force_sms=False)

async def create_channel_and_post():
    print("Клиент авторизован")

    result = await client(functions.channels.CreateChannelRequest(
        title=channel_name,
        about=channel_about,
        megagroup=False
    ))
    channel = result.chats[0]
    print(f"Канал '{channel.title}' успешно создан.")

    file = await client.upload_file(image_path)

    await client.send_file(
        channel.id,
        file,
        caption=f"{post_text}\n{link_url}"
    )
    print("Пост успешно опубликован.")

with client:
    asyncio.get_event_loop().run_until_complete(create_channel_and_post())