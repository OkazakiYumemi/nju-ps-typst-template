// Basic layout
#let indent = h(2em)

// Environment for beautiful code blocks
#import "@preview/codly:0.2.0": *
#let codly_icon() = {
  box(
    height: 0.8em,
    baseline: 0.05em,
  )
  h(0.1em)
}

// Environment for algorithmic pseudocode
#import "@preview/lovelace:0.2.0": *
#let pseudocode = pseudocode.with(indentation-guide-stroke: 0.5pt)

// Mitex for latex math equations
#import "@preview/mitex:0.2.3": *

// Environment for sections, problems, solutions, etc
#let problem_counter = counter("problem")
#let section_counter = counter("section")

#let section(section_name: none) = {
  if section_name != none {
    align(center, text(20pt)[
      *#section_counter.step() #section_counter.display() #h(0.5em) #section_name*
    ])
  } else {
    align(center, text(20pt)[
      *#section_counter.step() #section_counter.display()*
    ])
  }
  problem_counter.update(0)
}

#let problem(
  problem_beginning: "Problem",
  problem_id: none,
  body
) = {
  if problem_id != none {
    [== #problem_beginning #problem_counter.step() #problem_counter.display() (#problem_id)]
  } else {
    [== #problem_beginning #problem_counter.step() #problem_counter.display()]
  }

  set par(first-line-indent: 2em)

  body
}

#let solution(
  solution_beginning: "Solution:", 
  body
) = {
  if solution_beginning != none {
    [=== #solution_beginning]
  }
  set par(first-line-indent: 2em)
  block(
    width: 100%,
    inset: 8pt,
    radius: 4pt,
    stroke: gray,
    body)
  line(length: 100%, stroke: black)
}

// Some math operators
// Writing math operators in Typst is a bit tricky.
// if with difficulty, you can refer to the following links:
// https://typst.app/docs/reference/math/
// https://typst.app/docs/reference/symbols/sym/
#let argmin = [#math.arg]+[#math.min]


// Initiate the document title, author...
#let assignment_class(title, author, student_number, due_time, body) = {
  set text(font: ("Noto Serif CJK SC"), lang: "zh", region: "cn")
  set document(title: title, author: author)

  // Basic page settings
  set page(
    paper: "a4", 
    header: locate( 
      loc => if (
        counter(page).at(loc).first()==1) { none } 
      else { 
        let page_number = counter(page).at(loc).first()
        let total_pages = counter(page).final(loc).last()
        align(right, 
          [*#author* | *#title* | *Page #page_number of #total_pages*]
        ) 
      }
    ),
    // footer: locate(loc => {
    //   let page_number = counter(page).at(loc).first()
    //   let total_pages = counter(page).final(loc).last()
    //   align(center)[Page #page_number of #total_pages]
    // })
    )
  block(height:25%,fill:none)


  // Title and Infomation
  align(center, text(24pt)[*#title*])
  box(height: 40pt,
    columns(2, gutter: 14pt)[
      #set par(justify: true)
      #set text(14pt)
      #h(50%)  姓名：#underline(evade: false, offset: 2pt)[#author]

      #h(50%)  评分：#underline[]
      #colbreak()
      
      学号：#underline(evade: false, offset: 2pt)[#student_number]
      
      评阅：#underline[]
    ]
  )
  align(center, text(14pt)[#due_time])

  // Alerts or Announcements
  align(center)[
    #block(
      inset: 8pt,
      stroke: black,
      radius: 3pt
    )[
      这是适用于问题求解作业的 Typst 模板，

      同时也可用于写作实验报告等。

      但该模板仍在进行测试中，
      
      *请谨慎使用。*
    ]
  ]

  pagebreak(weak: false)



  // Enable the codly environment
  show: codly-init.with()
  show raw: it => box(
    text(font: ("FiraCode Nerd Font Mono", "Noto Sans CJK SC"), size: 10pt, it)
  )
  
  codly(
    display-icon: false,
    stroke-width: 1pt,
    stroke-color: rgb("666666"),
  )

 // Enable the lovelace environment
 show: setup-lovelace




  body
  
    // locate(loc => {
    //   let i = counter(page).at(loc).first()
    //   if i == 1 { return }
    //   set text(size: script-size)
    //   grid(
    //     columns: (6em, 1fr, 6em),
    //     if calc.even(i) [#i],
    //     align(center, upper(
    //       if calc.odd(i) { title } else { author-string }
    //     )),
    //     if calc.odd(i) { align(right)[#i] }
    //   )
    // })

//   if student_number != none {
//     align(top + left)[Student number: #student_number]
//   }

//   align(center)[= #title]
}

