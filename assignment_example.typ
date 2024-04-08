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

1. when $min(norm(bold(x))_2)$, $bold(x) = bold(x^*)$ is the solution to the problem, which is $x^*=vec(1/sqrt(3),1/sqrt(3),1/sqrt(3))$

2. We have a matrix $bold(A) = mat(1,1;1,1;1,0)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,1/2,0;1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,1/2,1). $ 

3. We have a  matrix $bold(A) = mat(1,-1;-1,1;2,2)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,-1/2,0;-1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,-1/2,0). $
]

#problem()[]

#solution[
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
1. If we take the derivative of $1/2 norm(bold(x)-bold(x)^(t-1))^2 + gamma g(bold(x))$, we have
$ bold(x^t) = prox_(gamma g)(bold(x)^(t-1)) =  bold(x)^(t-1) - gamma nabla g(bold(x^t)) $

2. By the convexity of $g$, we know that $g(bold(x)^(t)) +nabla g(bold(x^(t)))^T (bold(x)^(t-1)-bold(x^t))<= g(bold(x^(t-1)))$. Hence, we have
$ g(bold(x)^(t)) <= g(bold(x^(t-1))) - nabla g(bold(x^(t)))^T (bold(x)^(t-1)-bold(x^t)) = g(bold(x^(t-1))) - gamma nabla norm(g(bold(x^(t))))^2_2 $

3. because $bold(x^t) =  bold(x)^(t-1) - gamma nabla g(bold(x^t))$ which is a gradient descent method, so
$ -oo<g(bold(x)^t)<=g(bold(x)^(t-1)) $ and we have $ g(bold(x)^(t)) <=  g(bold(x^(t-1))) - gamma nabla norm(g(bold(x^(t))))^2_2 $ hence $ 0<=gamma nabla norm(g(bold(x^(t))))^2_2<=0 $ if $ t arrow +oo $
]

#problem()[]

#solution[
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

#solution[

#indent This a test for code blocks.


For rust:

```rust
pub fn main() {
    println!("Hello, world!");
}
```

#indent For haskell:

```haskell
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
```

#indent Select only a range of lines to show:

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

#indent Disable line numbers:

#codly(enable-numbers: false)

```cpp
int main() {
  cout << "Hello, World!"; // 你好，世界
  return 0;
}
```

#indent Then pseudocodes.
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

#section(section_name: "作业 (选做部分)")

#problem(problem_id: "EoSD 9961")[
    #indent How to pass 「レッドマジック」？
]

#solution[
    #indent Practice more.
]