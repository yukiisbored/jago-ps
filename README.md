# 🐔 jago

jago is a simplified markup language to author HTML pages.

## Want a taste?

Confused? Here's an annotated version of this example: [`sample.jago`](./sample.jago)

```jago
"<!DOCTYPE html>"
html [lang="en"]
  head
    title "Haruhi suzumiya's personal website"

    meta [charset="utf-8"]
    meta [name="viewport"
          content="width=device-width, initial-scale=1"]
    meta [name="description"
          content="Haruhi's personal space on the wild wild web"]

  body
    header
      img [src="//upload.wikimedia.org/wikipedia/en/4/48/Suzumiya_Haruhi.jpg"
           alt="Picture of myself"]
      h1 "Haruhi Suzumiya"
      h2 i "President of the SOS Brigade club"

    div [class="border"]
      h3 "Biography"
      p "Hello, world! Welcome to my small space on the corner of the web. "
        "I'm a high school student from Nishinomiya, Japan and interested in "
        `"supernatural phenomena" and "figures", such as `
        a [href="//en.wikipedia.org/wiki/Extraterrestrial_life"] "aliens"
        ", "
        a [href="//en.wikipedia.org/wiki/Time_travel"] "time travelers"
        ", and "
        a [href="//en.wikipedia.org/wiki/Esper"] "espers"
        ". If you know any, please let me know by shooting me an email at "
        a [href="mailto:haruhi.suzumiya@example.jp"] "haruhi.suzumiya@example.jp"
        "."

    div [class="border"]
      h3 "Members"
      ul li "Haruhi Suzumiya"
         li "Mikuru Asahina"
         li "Yuki Nagato"
         li "Itsuki Koizumi"
         li "Kyon"

    footer
      p "This webpage is authored using the cock markup language."
```
