# BIOS512 Assignment #1

This assignment will be submitted via GitHub. Once complete, download your notebook and upload it to your GitHub repository for the class.

*Note:*
- To download a notebook with Jupyter Lab, right click on the notebook in the sidebar file browser on the left and select `Download`.
- To download a notebook in the Jupter Notebook interface, click `File > Download As > Notebook (.ipynb)`.



Import the `tidyverse` into your R session.


```R
library('tidyverse')
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.2.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.2.0     [32m✔[39m [34mpurrr  [39m 0.3.2
    [32m✔[39m [34mtibble [39m 2.1.3     [32m✔[39m [34mdplyr  [39m 0.8.3
    [32m✔[39m [34mtidyr  [39m 0.8.3     [32m✔[39m [34mstringr[39m 1.4.0
    [32m✔[39m [34mreadr  [39m 1.3.1     [32m✔[39m [34mforcats[39m 0.4.0
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    


What `tidyverse` functions have conflicts with other functions in your R session? (Answer in a markdown cell using the bulleted list list syntax)

- Tidyverse Function with Conflicts
    - dplyr::filter() masks stats::filter()
    - dplyr::lag()    masks stats::lag()

Preview the `mpg` dataset.


```R
mpg %>% head
```


<table>
<caption>A tibble: 6 × 11</caption>
<thead>
	<tr><th scope=col>manufacturer</th><th scope=col>model</th><th scope=col>displ</th><th scope=col>year</th><th scope=col>cyl</th><th scope=col>trans</th><th scope=col>drv</th><th scope=col>cty</th><th scope=col>hwy</th><th scope=col>fl</th><th scope=col>class</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>audi</td><td>a4</td><td>1.8</td><td>1999</td><td>4</td><td>auto(l5)  </td><td>f</td><td>18</td><td>29</td><td>p</td><td>compact</td></tr>
	<tr><td>audi</td><td>a4</td><td>1.8</td><td>1999</td><td>4</td><td>manual(m5)</td><td>f</td><td>21</td><td>29</td><td>p</td><td>compact</td></tr>
	<tr><td>audi</td><td>a4</td><td>2.0</td><td>2008</td><td>4</td><td>manual(m6)</td><td>f</td><td>20</td><td>31</td><td>p</td><td>compact</td></tr>
	<tr><td>audi</td><td>a4</td><td>2.0</td><td>2008</td><td>4</td><td>auto(av)  </td><td>f</td><td>21</td><td>30</td><td>p</td><td>compact</td></tr>
	<tr><td>audi</td><td>a4</td><td>2.8</td><td>1999</td><td>6</td><td>auto(l5)  </td><td>f</td><td>16</td><td>26</td><td>p</td><td>compact</td></tr>
	<tr><td>audi</td><td>a4</td><td>2.8</td><td>1999</td><td>6</td><td>manual(m5)</td><td>f</td><td>18</td><td>26</td><td>p</td><td>compact</td></tr>
</tbody>
</table>



Using the `mpg` dataset, make a scatter chart with `displ` on the x-axis and `hwy` on the y-axis.


```R
p = ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

p


```


![png](output_9_0.png)


Color the points from your plot by `class`.


```R
p = ggplot(mpg, aes(x=displ, y=hwy, color=class)) + geom_point()

p


```


![png](output_11_0.png)


Add a `smooth` geom to your `mpg` plot.


```R
# not separated by class

p = ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

p = p + geom_smooth()

p


# separated by class on same plot 

p2 = ggplot(mpg, aes(x=displ, y=hwy, color=class)) + geom_point()

p2 = p2 + geom_smooth()

p2

# separated by class on different plots

p3 = ggplot(mpg, aes(x=displ, y=hwy, color=class)) + geom_point()

p3 = p3 + geom_smooth() + facet_wrap(~ class, ncol=1)

p3

```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'
    
    `geom_smooth()` using method = 'loess' and formula 'y ~ x'
    
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “span too small.   fewer data values than degrees of freedom.”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “pseudoinverse used at 5.6935”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “neighborhood radius 0.5065”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “reciprocal condition number  0”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “There are other near singularities as well. 0.65044”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “span too small.   fewer data values than degrees of freedom.”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “pseudoinverse used at 5.6935”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “neighborhood radius 0.5065”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “reciprocal condition number  0”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “There are other near singularities as well. 0.65044”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “pseudoinverse used at 4.008”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “neighborhood radius 0.708”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “reciprocal condition number  0”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “There are other near singularities as well. 0.25”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “pseudoinverse used at 4.008”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “neighborhood radius 0.708”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “reciprocal condition number  0”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “There are other near singularities as well. 0.25”



![png](output_13_1.png)


    `geom_smooth()` using method = 'loess' and formula 'y ~ x'
    
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “span too small.   fewer data values than degrees of freedom.”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “pseudoinverse used at 5.6935”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “neighborhood radius 0.5065”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “reciprocal condition number  0”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “There are other near singularities as well. 0.65044”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “span too small.   fewer data values than degrees of freedom.”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “pseudoinverse used at 5.6935”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “neighborhood radius 0.5065”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “reciprocal condition number  0”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “There are other near singularities as well. 0.65044”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “pseudoinverse used at 4.008”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “neighborhood radius 0.708”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “reciprocal condition number  0”
    Warning message in simpleLoess(y, x, w, span, degree = degree, parametric = parametric, :
    “There are other near singularities as well. 0.25”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “pseudoinverse used at 4.008”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “neighborhood radius 0.708”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “reciprocal condition number  0”
    Warning message in predLoess(object$y, object$x, newx = if (is.null(newdata)) object$x else if (is.data.frame(newdata)) as.matrix(model.frame(delete.response(terms(object)), :
    “There are other near singularities as well. 0.25”



![png](output_13_3.png)



![png](output_13_4.png)


What are two chart features you can adjust in `ggplot2` to help with overplotting? (Answer in a markdown cell using the **numbered** list syntax) 

1. The alpha feature changes the transparency of the points on the plot, sometimes making points more visible if they overlap on the plot. 
1. The facet_wrap feature returns a symmetrical matrix of plots for the number of levels of a variable. The facet_grid feature also forms a matrix of panels defined by row and column faceting variables. 


```R

```
