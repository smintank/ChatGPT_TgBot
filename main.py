import os
import openai
from aiogram import Bot, Dispatcher, executor, types
from middlewares import AccessMiddleware

openai.api_key = os.getenv("OPENAI_API")
ACCESS_ID = (os.getenv("TELEGRAM_ACCESS_ID"))

bot = Bot(token=os.getenv("TG_BOT_TOKEN"))
dp = Dispatcher(bot)
dp.middleware.setup(AccessMiddleware(ACCESS_ID))


@dp.message_handler()
async def message_handle(message: types.Message):
    response = openai.Completion.create(
        model="text-davinci-003",
        prompt=message.text,
        temperature=0.5,
        max_tokens=1000,
        top_p=1.0,
        frequency_penalty=0.5,
        presence_penalty=0.0
    )
    await message.answer(text=response['choices'][0]['text'])


if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)




