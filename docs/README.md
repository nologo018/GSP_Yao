# Touch project document site 
This site is collect diagram, ref doc and another file include in project. <br>
Everyone can add, edit and access file for support your team. <br>
However if you found some bug. Please report **MARS** team

## Project key table
You will found `Key name` in sidebar menu. <br>

| Key name | Project name                    |
| ------------- | ------------------------------ |
| `SPP`      | Smart pole       |

## How to download diagram
1. Export with live site.
    1. Open this site URL: https://mermaid.live/edit <br>
    2. Open file diagram in source code 
    3. Remove first line and last line in source code
    4. Copy edited source code and paste code in live site
    5. Click export diagram to local drive
2. Export with screenshot
    1. Open diagram with editor or touch document site

<br>

![image](https://i.pinimg.com/originals/73/a0/f3/73a0f364ada522442046e833aac518c6.png)

## Installation for implement
1. Install editor in you computer (Suggest VS code)
2. Install `docsify` in local <br> ref: https://docsify.js.org/#/quickstart
3. Start project
4. **LET START TO IMPLEMENT !!!** <br>
TIP: use `PLAYGROUND.mmd` for implement with vs code plugins. This so simple for implement.
5. After implement. Don't forget update `history.md`

## Customize sidebar
Edit file `_sidebar.md` with this structure.
```
    - [Root Menu]
        - [Sub Menu]
            - [Inner Sub Menu]
                - [Inner In Inner Menu]
                    - [...]
```
ref: https://github.com/iPeng6/docsify-sidebar-collapse

## Structure in document
```
    - root git
        - docs
            - project A
                - README A
            - project B
                - README B
            - project xxx
                - README xxx
        - HOME Readme   
    - README.md
```

## 
ref: V1

> **Author:** SUTHON.S