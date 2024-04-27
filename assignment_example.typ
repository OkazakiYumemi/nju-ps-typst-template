#import "hw-preamble.typ": *
#let title = "第 1 讲: 测试"
#let author = "张三"
#let student_number = "998244353"
#let due_time = "2024 年 2 月 31 日"
#show: assignment_class.with(title, author, student_number, due_time)

#section(section_name: "作业 (必做部分)")

#problem(problem_id: "AC 1.2-3")[]

#solution[
// + $A=mat(1,-1;-1,1;1,1)$

#set enum(numbering: "a)")

#solsection(solsection_name: lorem(3))

1. when $min(norm(bold(x))_2)$, $bold(x) = bold(x^*)$ is the solution to the problem, which is $x^*=vec(1/sqrt(3),1/sqrt(3),1/sqrt(3))$

2. We have a matrix $bold(A) = mat(1,1;1,1;1,0)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,1/2,0;1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,1/2,1). $ 

#solsection(solsection_name: lorem(5))

3. We have a  matrix $bold(A) = mat(1,-1;-1,1;2,2)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,-1/2,0;-1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,-1/2,0). $
]

#problem()[]

#solution[

#let prox = [#math.op("prox")]
// #let proj = [#math.op("proj")]

// + $ op("prox")_g (bold(y)) = arg min_(bold(x in RR ^n)) {1/2 norm(bold(x)-bold(y))^2 + g(bold(x))}. $ 
1. we know that:
$ prox_phi (z) = argmin_(x in RR) {1/2 norm(x-z)^2 + phi.alt(x-c)}. $ 
let $x prime =x-c$ $ op("prox")_phi (z) = argmin_(x in RR) {1/2 norm(x prime-(z-c))^2 + phi.alt(x'+c-c)}+c = op("prox")_phi.alt (z-c)+c. $

2. if we want to $ f(x) = 1/2 norm(x-z)^2 + phi.alt(x)$ to be minimized, we need to find the $x$ that makes the derivative of the function equal to zero.
we know 
$ diff f(x) =  cases(x-z + lambda "when " x>0, [x-z - lambda,x-z + lambda] "when" x=0, x-z - lambda "when" x<0)  $. 
Hence, let $ diff f(x) = 0 $, we have
$ prox_phi.alt(z) = x^* = cases(z-lambda "when " z>lambda,
[z-lambda,z+lambda] "when" z in [-lambda,lambda],
 z + lambda "when" z < -lambda) . $
 
3. if $phi(x) = lambda abs(x-c)$, where $c in RR$ and $lambda>0$. Use the result from part a. 
$ prox_phi(z) = prox_phi.alt(z-c)+c  = cases(z-lambda "when " z>lambda + c,
[z-lambda,z+lambda] "when" z in [-lambda+c,lambda+c],
 z + lambda "when" z < -lambda+c) $
]

#problem()[]

#solution[  
#let prox = [#math.op("prox")]
// #let proj = [#math.op("proj")]

1. If we take the derivative of $1/2 norm(bold(x)-bold(x)^(t-1))^2 + gamma g(bold(x))$, we have
$ bold(x^t) = prox_(gamma g)(bold(x)^(t-1)) =  bold(x)^(t-1) - gamma nabla g(bold(x^t)) $

2. By the convexity of $g$, we know that $g(bold(x)^(t)) +nabla g(bold(x^(t)))^T (bold(x)^(t-1)-bold(x^t))<= g(bold(x^(t-1)))$. Hence, we have
$ g(bold(x)^(t)) <= g(bold(x^(t-1))) - nabla g(bold(x^(t)))^T (bold(x)^(t-1)-bold(x^t)) = g(bold(x^(t-1))) - gamma nabla norm(g(bold(x^(t))))^2_2 $

3. because $bold(x^t) =  bold(x)^(t-1) - gamma nabla g(bold(x^t))$ which is a gradient descent method, so
$ -oo<g(bold(x)^t)<=g(bold(x)^(t-1)) $ and we have $ g(bold(x)^(t)) <=  g(bold(x^(t-1))) - gamma nabla norm(g(bold(x^(t))))^2_2 $ hence $ 0<=gamma nabla norm(g(bold(x^(t))))^2_2<=0 $ if $ t arrow +oo $
]

#problem(problem_id: "ST 5.5-5")[]

#solution(solution_beginning: "Proof:")[
1. because
$ 
diff f(bold(x)) =  {bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n}
$
if $g(bold(x)) = theta f(bold(x))$, 
$ 
diff g(bold(x)) =  {bold(v) in RR^n : g(bold(y))>= g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} $
$ diff g(bold(x))={bold(v) in RR^n : theta f(bold(y))>= theta f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n}
$
$ diff g(bold(x))={bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T/theta (bold(y)-bold(x)),forall bold(y) in RR^n}
$
$ diff g(bold(x))=theta {bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} = theta diff f(bold(x))
$

2. 
$ 
diff h(bold(x)) =  {bold(v) in RR^n : f(bold(y))+g(bold(y))>= f(bold(x))+g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} $
all of the elements that satisfy $ f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n $ and $ g(bold(y))>= g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n $  are in the set $ diff h(bold(x)) $ hence $ diff f(bold(x)) + diff g(bold(x)) subset.eq diff h(bold(x)) $ 

3. we know that $ diff norm(x)_1 =  cases(1 "when " x>0, [-1,1] "when" x=0, -1 "when" x<0)  $. 
hence $op("sgn")(x) in diff norm(x)_1$.
]

#problem()[]

#solution()[
  #indent 中文排印测试：

  Here's a test sentence, "I can eat glass, it does not hurt me."
  
  这是一条测试语句：“我能吞下玻璃而不伤身体。”

  這是一條測試語句：「我能吞下玻璃而不傷身體。」

  // 此處目前仍有問題，具體而言，當將 Noto Serif 字形置於 Noto Serif CJK 字形之前時，中文引號的顯示效果與英文引號相同，並且不會參與標點擠壓。正在尋找解決方案。用家可以在文章較多使用中文時，僅使用 Noto Serif CJK 字形，來保證中文排印的效果。

  默認使用 "IBM Plex Serif", "Source Han Serif SC", "Noto Serif CJK SC" 字形，並且設置語言為 "zh" ，地區為 "cn" 。

  目前的效果是，當引號`"`兩邊有 CJK 字符，引號將以半角顯示"，否則正常顯示英文引號。

  測試："中文引號", "quotation marks".
]

#problem()[]

#solution[

#indent This a test for code blocks.

For rust:

```rust
pub fn main() {
    println!("Hello, world!");
}
```

For haskell:

```haskell
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
```

Select only a range of lines to show:

#codly-range(start: 3, end: 7)

```python
import numpy as np

def fibonaci(n):
  if n <= 1:
    return n
  else:
    return(fibonaci(n-1) + fibonaci(n-2))

fibonaci(10)
```

Disable line numbers:

#codly(enable-numbers: false)

```cpp
int main() {
  cout << "Hello, World!"; // 你好，世界
  return 0;
}
```

Then pseudocodes.
#algorithm(
  caption: [The Euclidean algorithm],
  pseudocode(
    no-number,
    [*input:* integers $a$ and $b$],
    no-number,
    [*output:* greatest common divisor of $a$ and $b$],
    <line:while1>,
    [*while* $a != b$ *do*], ind,
      [*if* $a > b$ *then*], ind,
        $a <- a - b$, ded,
      [*else*], ind, 
        [$b <- b - a$ #comment[comment test]], ded,
      [*end* #comment[another comment test]], ded,
    [*end*],
    [*return* $a$]
  )
)

  #indent In @line:while1, we have a while loop.

  The algorithm figure's breakable.

]

#problem(problem_id: "")[
  This is a test for CeTZ.
]

#solution()[
  // #set page(width: auto, height: auto, margin: .5cm)

  // #show math.equation: block.with(fill: white, inset: 1pt)
#cetz.canvas(length: 3cm, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 2),
    stroke: (thickness: 0.4pt, cap: "round"),
    angle: (
      radius: 0.3,
      label-radius: .22,
      fill: green.lighten(80%),
      stroke: (paint: green.darken(50%))
    ),
    content: (padding: 1pt)
  )

  grid((-1.5, -1.5), (1.4, 1.4), step: 0.5, stroke: gray + 0.2pt)

  circle((0,0), radius: 1)

  line((-1.5, 0), (1.5, 0), mark: (end: "stealth"))
  content((), $ x $, anchor: "west")
  line((0, -1.5), (0, 1.5), mark: (end: "stealth"))
  content((), $ y $, anchor: "south")

  for (x, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (1, $ 1 $)) {
    line((x, 3pt), (x, -3pt))
    content((), anchor: "north", ct)
  }

  for (y, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (0.5, $ 1/2 $), (1, $ 1 $)) {
    line((3pt, y), (-3pt, y))
    content((), anchor: "east", ct)
  }

  // Draw the green angle
  cetz.angle.angle((0,0), (1,0), (1, calc.tan(30deg)),
    label: text(green, [#sym.alpha]))

  line((0,0), (1, calc.tan(30deg)))

  set-style(stroke: (thickness: 1.2pt))

  line((30deg, 1), ((), "|-", (0,0)), stroke: (paint: red), name: "sin")
  content(("sin.start", 50%, "sin.end"), text(red)[$ sin alpha $])
  line("sin.end", (0,0), stroke: (paint: blue), name: "cos")
  content(("cos.start", 50%, "cos.end"), text(blue)[$ cos alpha $], anchor: "north")
  line((1, 0), (1, calc.tan(30deg)), name: "tan", stroke: (paint: orange))
  content("tan.end", $ text(#orange, tan alpha) = text(#red, sin alpha) / text(#blue, cos alpha) $, anchor: "west")
})

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let data = (
    [A], ([B], [C], [D]), ([E], [F])
  )

  set-style(content: (padding: .2),
    fill: gray.lighten(70%),
    stroke: gray.lighten(70%))

  cetz.tree.tree(
    data, spread: 2.5, 
    grow: 1.5, 
    draw-node: (node, ..) => {
      circle((), radius: .45, stroke: none)
      content((), node.content)
    }, draw-edge: (from, to, ..) => {
      line((a: from, number: .6, b: to),
          (a: to, number: .6, b: from), mark: (end: ">"))
    }, name: "tree"
  )

  // Draw a "custom" connection between two nodes
  let (a, b) = ("tree.0-0-1", "tree.0-1-0",)
  line((a, .6, b), (b, .6, a), mark: (end: ">"))
})
]


#section(section_name: "作业 (选做部分)")

#problem(problem_id: "EoSD 9961")[
    #indent How to pass 「レッドマジック」？
]

#solution[
    #indent Practice more.
]