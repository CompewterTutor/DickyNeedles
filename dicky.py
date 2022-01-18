# bot.py
import os

import discord
from dotenv import load_dotenv
from discord.ext import commands
import pytesseract
import cv2
import re


load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')
GUILD = os.getenv('DISCORD_GUILD')

dickybot = commands.Bot(command_prefix('!'))

@dickybot.event
async def on_ready():
    for guild in dickybot.guilds:
        if guild.name == GUILD:
            break

    print(
        f'{dickybot.user} is connected to the guild: \n'
        f'{guild.name}(id: {guild.id})'
    )
    print(f'{dickybot.user} has connected to Discord!')

client.run(TOKEN)