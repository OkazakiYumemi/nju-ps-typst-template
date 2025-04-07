// Basic layout
#let ind2 = h(2em)

// Environment for beautiful code blocks
// #import "@preview/codly:1.2.0": *
// #let codly_icon() = {
//   box(
//     height: 0.8em,
//     baseline: 0.05em,
//   )
//   h(0.1em)
// }
// Use zebraw instead of codly
#import "@preview/zebraw:0.4.7": *

// Environment for algorithmic pseudocode
#import "@preview/lovelace:0.3.0": *
#let pseudocode = pseudocode.with(indentation-guide-stroke: 0.5pt)
#let comment-color = gray
#let comment(body) = {
  h(1fr)
  text(size: .85em, fill: comment-color, sym.triangle.stroked.r + sym.space + body)
}

// Mitex for latex math equations
#import "@preview/mitex:0.2.5": *

// CeTZ for drawing
#import "@preview/cetz:0.3.4"
// Fletcher for drawing
#import "@preview/fletcher:0.5.6"

// Environment for sections, problems, solutions, etc
#let problem_counter = counter("problem")
#let section_counter = counter("section")
#let solsection_counter = counter("solsection")
#let default_problem_beginning = "Problem"
#let default_solution_beginning = "Solution:"

#let section(title: none) = {
  if title != none {
    align(center, text(20pt)[
      == #section_counter.step() #context [#section_counter.display()] #h(0.5em) #title
    ])
  } else {
    align(center, text(20pt)[
      == #section_counter.step() #context [#section_counter.display()]
    ])
  }
  problem_counter.update(0)
}

#let problem(
  beginning: default_problem_beginning,
  title: none,
  body
) = {
  if title != none {
    if beginning != none {
      text(14pt)[=== #beginning #problem_counter.step() #context [#problem_counter.display()] (#title)]
    } else {
      text(14pt)[=== #problem_counter.step() #title]
    }
  } else {
    text(14pt)[=== #beginning #problem_counter.step() #context [#problem_counter.display()]]
  }

  set par(first-line-indent: (amount: 2em, all: true))
  // set par(first-line-indent: 2em)

  body
}

#let solution(
  beginning: default_solution_beginning,
  body
) = {
  if beginning != none {
    v(.3em)
    text(12pt)[*#beginning*]
    // text(12pt)[=== #beginning]
  }
  
  solsection_counter.update(0)
  set par(first-line-indent: (amount: 2em, all: true))
  // set par(first-line-indent: 2em)

  v(-.5em)
  block(
    width: 100%,
    inset: 8pt,
    radius: 4pt,
    stroke: gray,
    body)
  line(length: 100%, stroke: black)
}

#let solsection(
  title: none
) = {
  if title != none {
    text(12pt)[*#solsection_counter.step() #context [#solsection_counter.display()] #h(0.5em) #title*]
  } else {
    text(12pt)[*#solsection_counter.step() #context [#solsection_counter.display()]*]
  }
}

// Some math operators
// Writing math operators in Typst is a bit tricky.
// if with difficulty, you can refer to the following links:
// https://typst.app/docs/reference/math/
// https://typst.app/docs/reference/symbols/sym/
#let argmin = [#math.arg]+[#math.min]
#let argmax = [#math.arg]+[#math.max]

// Initiate the document title, author...
#let assignment_class(title: none, author: none, student_number: none, due_time: datetime.today(), body) = {
  set text(font: ("IBM Plex Serif", "Noto Serif CJK SC", "Noto Sans CJK TC"), lang: "zh", region: "cn")
  set document(title: title, author: author)

  // Basic page settings
  set page(
    paper: "a4", 
    header: context {
      if here().page() == 1 {
        none
      } else {
        let page_number = counter(page).display()
        let total_pages = counter(page).final().first()
        align(right, 
          [*#author* | *#title* | *Page #page_number of #total_pages*]
        )
      }
    },
    // footer: context {
    //   let page_number = counter(page).display()
    //   let total_pages = counter(page).final().first()
    //   align(center)[Page #page_number of #total_pages]
    // }
    )
  block(height: 25%, fill: none)
  // set par(first-line-indent: (amount: 2em, all: true))


  // Title and Infomation
  align(center, text(24pt)[*#title*])
  block(
    // height: 40pt,
    // columns(2, gutter: 14pt)[
    //   #set par(justify: true)
    //   #set text(14pt)
    //   #h(50%)  姓名：#underline(evade: false, offset: 2pt)[#author]

    //   #h(50%)  评分：#underline[]
    //   #colbreak()
      
    //   学号：#underline(evade: false, offset: 2pt)[#student_number]
      
    //   评阅：#underline[]
    // ]
    height: 50pt,
    [
      #set par(justify: true)
      #set text(14pt)
      #grid(
        columns: (20%, auto, 0.85fr, auto, 1fr, 20%),
        rows: (50%, 50%),
        column-gutter: (0pt, 6pt, 14pt, 6pt, 0pt),
        [],
        [姓名：],
        [#align(center)[#author] #v(2pt, weak: true) #line(length: 100%, stroke: .7pt)],
        [学号：],
        [#align(center)[#student_number] #v(2pt, weak: true) #line(length: 100%, stroke: .7pt)],
        [],

        [],
        [评阅：],
        [#hide([评阅人]) #v(2pt, weak: true) #line(length: 100%, stroke: .7pt)],
        [评分：],
        [#hide([分数]) #v(2pt, weak: true) #line(length: 100%, stroke: .7pt)],
        [],
      )
    ]
  )
  align(center, text(14pt)[#due_time.display("[year repr:full] 年 [month repr:numerical padding:none] 月 [day padding:zero] 日")])

  // Alerts or Announcements
  align(center)[
    #block(
      inset: 8pt,
      stroke: black,
      radius: 3pt
    )[
      这是适用于问题求解作业的 #link("https://github.com/OkazakiYumemi/nju-ps-typst-template")[Typst 模板]，

      // 同时也可用于其他类型的作业。
      也可用于其他类型的作业与报告等。

      该模板仍在进行测试中，
      
      *请谨慎使用。*

      // 这是适用于问题求解作业的 #link("https://github.com/OkazakiYumemi/nju-ps-typst-template")[Typst 模板]，

      // 经过一段时间的测试，

      // 已经基本稳定。

      // 同时也可用于写作实验报告等。
    ]
  ]

  pagebreak(weak: false)



  // Enable the codly environment
  // show: codly-init.with()
  show: zebraw-init.with(
    ..zebraw-themes.zebra-reverse,
    lang: true,
    lang-color: teal,
    // lang-font-args: (),
    comment-color: yellow.lighten(80%),
  )
  show raw: set text(font: ("FiraCode Nerd Font Mono", "Noto Serif"))
  
  // codly(
  //   display-icon: false,
  //   stroke: 1pt + rgb("666666")
  // )

  // // Enable the lovelace environment
  // show: setup-lovelace

  // Setting link style
  show link: it => text(blue, underline(it, evade: false, offset: 2pt))


  body
}

