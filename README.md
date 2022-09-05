# NoIntroSetExtractor
This Windows script is designed to simplify the extraction of No Intro Set Directories. However, it could, theoretically, be used with any directory of zipped archives that need to be extracted into individual alphabetized directories (it will create these alphabetized directories itself). With large sets of archives, extracting each archive one by one is time consuming and boring. This script aims to automate that as much as possible. Please note: some directories may not get picked up by this if they start with something that is not alphanumeric, so you'll need to manually handle those.

## What Is A "No Intro Set"?
A No Intro Set is a set of ROMs collected by the No-Intro Group. The group exists to preserve old video games through the collection of ROMs for entire systems.  The goal is to create collections that are as accurate to the original cartridges as possible, so there are no ROM Hacks, bad dumps, etc. They want to use only the cleanest dumps/ROM files to keep everything as accurate as possible. You can read more about the group [here](http://www.no-intro.org/index.html) if you're interested.

## Where Can I Find No Intro Sets?
**YOU WILL NOT FIND ANY ROMs HERE NOR WILL I INSTRUCT YOU ON HOW TO FIND THEM.**<br/>
Do your own research, I promise you it's not that hard.

## How Does It Work?
Say we download a No Intro Set for Atari 5200. It will start like this:

![step1](https://github.com/timmonfette1/NoIntroSetExtractor/blob/master/READMEImages/Step1.png)

Now, when we extract it, we will see that inside of it is each individual ROM in it's own archive:

![step2](https://github.com/timmonfette1/NoIntroSetExtractor/blob/master/READMEImages/Step2.png)

From here, all we need to do is setup the script to run (see below) and when it's done, this will be the result in the desired output directory:

![step3](https://github.com/timmonfette1/NoIntroSetExtractor/blob/master/READMEImages/Step3.png)

All original zip archives will be deleted, all that will be left will be each individual ROM in it's appropriate, alphabetized, directory.

## Setup
Before you can run this script, you'll need to have 7-Zip installed (honestly, if you're extracting files without 7-Zip, you're messing up).  You can find 7-Zip [on the official website](https://www.7-zip.org/).<br/><br/>
After installing 7-Zip if you don't already have it, there are 3 vairables you need to set yourself in the script to make it run successfully. You just need to open it in a text editor (Notepad, VS Code, etc.) and set the following variables:
```
SET SourceDir=
SET DestDir=
SET SevenZipLocation=
```
In order of appearance, these variables represent the following:
- The directory containing all of the ROM archives in the No Intro Set
- The directory you want to write all of the resulting folders to
- The path to your 7-Zip exe

If I was to fill them out, they'd look like the following:
```
SET SourceDir=.
SET DestDir=.
SET SevenZipLocation=D:\programData\7-Zip\7z.exe
```
I like to move the script to whatever directory I keep the ROMs in to prevent having to change these variables every time

## How to Use
After this setup, the script is ready to use. If necessary, move the script around and whenever you're ready to run it, just double click on the script to let it execute. Depending on the number of ROM archives, it may take a while.
