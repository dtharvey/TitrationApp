library(shiny)
library(titrationCurves)
library(shape)

# initial set up

shinyUI(fluidPage(
  withMathJax(),
  tags$style(HTML("
                  p {
                  font-size: 16px;
                  # font-weight: bold;
                  }
  
                  h4 {
                  font-size: 18px;
                  }

                  h5 {
                  font-size: 16px;
                  font-weight: bold;
                  }

                  ")),
  
  tabsetPanel(
    
# set up for home page
    
    tabPanel("Home",
             column(
               width = 10,
               offset = 1,
               h1("Designing an Acid-Base Titration", 
                  align = "center"),
               br(),
               HTML("<p>Most introductory courses in chemistry include a
                    brief introduction to acid-base titrimetry, often 
                    in the context of a laboratory experiment in which you
                    determine the concentration of one species, which
                    we call the analyte, by determining the amount of 
                    a second species, which we call the titrant, that
                    reacts stoichiometrically with the analyte. The 
                    titrant is added, using a buret, to a solution that 
                    contains the analyte, and the volume of titrant 
                    needed to reach the stoichiometric equivalence point 
                    is determined using a visual indicator whose change 
                    in color signals the titration's end point, or by 
                    monitoring the pH of the reaction mixture; if all 
                    is well, the difference between the experimental 
                    end point and the theoretical equivalence point is 
                    sufficiently small that it does not affect the 
                    accuracy of the analysis. Because we know the 
                    concentration and the volume of titrant, we can 
                    determine the moles of analyte in the original 
                    sample. In this learning module we take a closer 
                    look at acid-base titrimetry using the following 
                    series of investigations:</p>"),
               HTML("<ul> 
                    <li> 
                    <p>Investigation 1: Titration of a Strong Acid
                      or a Strong Base</p>
                    </li>
                    <li> 
                    <p>Investigation 2: Titration of a Monoprotic
                      Weak Acid or Weak Base</p>
                    </li>
                    <li> 
                    <p>Investigation 3: Titration of a Diprotic Weak
                      Acid or Weak Base</p>
                    </li>
                    <li> 
                    <p>Investigation 4: Titration of a Mixture of Weak
                      Acids or Weak Bases</p>
                    <li>
                    <p>Investigation 5: Practice Problems—Designing
                      Titrations</p>
                    </li>
                    </ul>"),
               HTML("<p>In the first four investigations you will explore
                    the effect on a titration curve of the analyte's 
                    properties and the titrant's properties, including 
                    variables such as concentration and 
                    p<em>K<sub>a</em></sub> or p<em>K<sub>b</sub></em> 
                    values. You also will consider the utility of 
                    acid-base indicators in signaling a 
                    titration's end point. The last investigation provides
                    you with the opportunity to design titrations 
                    to solve particular analytical problems.</p>")
             )
            ),
    
# set up for investigation 1
    
    tabPanel("Investigation 1",
             fluidRow(
               column(
                 width = 4, 
                 h4("Titration of a Strong Acid or a Strong Base"),
                 helpText(
                  "For the titration of a strong acid analyte or a 
                  strong base analyte, the shape and the position of the 
                  titration curve is a function of three 
                  variables: the analyte's initial concentration, the 
                  initial volume of the analyte's solution, and the 
                  titrant's concentration."
                  ),
                 helpText(
                  "The controls below allow you to define the conditions 
                  for the titration, including the option to include 
                  a visual indicator and to control the range of 
                  titrant volumes to plot on the \\(\\textit{x}\\)-axis; 
                  the resulting titration curve is shown on the far 
                  right. As you consider the effect of a variable on 
                  the titration curve, be sure to explore fully the range 
                  of its possible values and its interaction with 
                  other variables."
                 )
               ),
               column(
                 width = 4,
                 h4("Questions"),
                 helpText(
                  "1. Explain how the three variables, both individually 
                  and collectively, determine the titration curve's shape, 
                  the location of the equivalence point along the 
                  \\(\\textit{x}\\)-axis, and the change in pH at the 
                  equivalence point."
                  ),
                 helpText(
                  "2. Which indicators are suitable for signaling the 
                  titration's end point? Explain your reasoning."),
                 helpText(
                  "3. In the absence of an indicator, is the change in 
                  pH at the equivalence point sufficient for a useful 
                  quantitative analysis? Explain your reasoning.")
               ),
               column(
                 width = 4,
                 plotOutput("plot_1a", height = "350px")
               )
             ),
             fluidRow(
               column(
                 width = 3,
                 h5("Analyte"),
                 radioButtons("radio_1a", label = NULL,
                              choices = c("strong acid", "strong base"),
                              selected = "strong acid", inline = TRUE),
                 sliderInput("slider_1a", "initial [analyte] (M)", 
                             min = 0.001, max = 0.25, step = 0.001, 
                             value = 0.10, ticks = FALSE),
                 sliderInput("slider_1d", "initial volume (mL)", 
                             min = 1, max = 50, value = 50, 
                             ticks = FALSE)
               ),
               column(
                 width = 3,
                 h5("Titrant"),
                 helpText("To manually set the titrant's concentration,
                          uncheck the checkbox."),
                 checkboxInput("checkbox_1a", "[titrant] = initial 
                               [analyte]?", value = TRUE),
                 sliderInput("slider_1b", "[titrant] (M)", min = 0.001,
                             max = 0.25, step = 0.001, value = 0.10, 
                             ticks = FALSE),
                 radioButtons("radio_1b", "Range of titrant volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 100 mL", inline = TRUE)
                 ),
               column(
                 width = 3,
                 h5("Indicator"),
                 radioButtons("radio_1c", "", choices =
                                c("none",
                                  "thymol blue: 1.2-2.8",
                                  "bromophenol blue: 3.0-4.6",
                                  "methyl red: 4.2-6.3",
                                  "bromothymol blue: 6.0-7.6",
                                  "cresol red: 7.2-8.8",
                                  "thymol blue: 8.0-9.6",
                                  "phenolphthalein: 8.3-10.0",
                                  "alizarin yellow R: 10.1-12.0"),
                              selected = "none")
               )
               ),
               column(
                 width = 3
               )
    ),
    
# set up for investigation 2
    
    tabPanel("Investigation 2",
             fluidRow(
               column(
                 width = 4,
                 h4("Titration of a Monoprotic Weak Acid or Weak Base"),
                 helpText(
                  "For the titration of a monoprotic weak acid analyte 
                  or  the titration of a monoprotic weak base analyte, 
                  the shape and the position of the titration 
                  curve is a function of four variables: the analyte's 
                  initial concentration, the initial volume of the analyte's
                  solution, the concentration of the titrant, and the 
                  analyte's \\(\\textrm{p}{K}_{a}\\) value or its 
                  \\(\\textrm{p}{K}_{b}\\) value."
                  ),
                 helpText(
                  "The controls below allow you to define the conditions 
                  for the titration, including the option to include 
                  a visual indicator and to control the range of 
                  titrant volumes to plot on the \\(\\textit{x}\\)-axis; 
                  the resulting titration curve is shown on the far 
                  right. As you consider the effect of a variable on 
                  the titration curve, be sure to explore fully the range 
                  of its possible values and its interaction with 
                  other variables."
                 )
                 ),
               column(
                 width = 4,
                 h4("Questions"),
                 helpText(
                   "1. Explain how the four variables, both individually 
                   and collectively, determine the titration curve's shape, 
                   the location of the equivalence point along the 
                   \\(\\textit{x}\\)-axis, and the change in pH at the 
                   equivalence point. In what ways is the titration 
                   curve for a weak acid or weak base similar to and 
                   different from the titration curve for a strong acid
                   or a stong base?"
                 ),
                 helpText(
                   "2. Which indicators are suitable for signaling the 
                   titration's end point? Explain your reasoning."),
                 helpText(
                   "3. In the absence of an indicator, is the change in 
                   pH at the equivalence point sufficient for a useful 
                   quantitative analysis? Explain your reasoning.")
               ),
               column(
                 width = 4,
                 plotOutput("plot_2a", height = "350px")
               )
               ), 
             
             fluidRow(
               column(
                 width = 3,
                 h5("Analyte"),
                 radioButtons("radio_2a", label = NULL, 
                              choices = c("weak acid", "weak base"),
                              selected = "weak acid", inline = TRUE),
                 sliderInput("slider_2c", "p\\({K}_{a}\\) or 
                             p\\({K}_{b}\\)", min = 2, max = 12,
                             step = 0.01, value = 7, ticks = FALSE),
                 sliderInput("slider_2a", "initial [analyte] (M)", 
                             min = 0.001, max = 0.25, step = 0.001, 
                             value = 0.10, ticks = FALSE),
                 sliderInput("slider_2d", "initial volume (mL)", 
                             min = 1, max = 50, value = 50, 
                             ticks = FALSE)
               ),
               column(
                 width = 3,
                 h5("Titrant"),
                 helpText("To manually set the titrant's concentration,
                          uncheck the checkbox."),
                 checkboxInput("checkbox_2a", "[titrant] = initial 
                               [analyte]?", value = TRUE),
                 sliderInput("slider_2b", "[titrant] (M)", min = 0.001,
                             max = 0.25, step = 0.001, value = 0.1,
                             ticks = FALSE),
                 radioButtons("radio_2b", "Range of volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 100 mL", inline = TRUE)
               ),
               column(
                 width = 3,
                 h5("Indicator"),
                 radioButtons("radio_2c", "", choices =
                                c("none",
                                  "thymol blue: 1.2-2.8",
                                  "bromophenol blue: 3.0-4.6",
                                  "methyl red: 4.2-6.3",
                                  "bromothymol blue: 6.0-7.6",
                                  "cresol red: 7.2-8.8",
                                  "thymol blue: 8.0-9.6",
                                  "phenolphthalein: 8.3-10.0",
                                  "alizarin yellow R: 10.1-12.0"),
                              selected = "none")
               ),
               column(
                 width = 3
               )
             ) 
             
          ),
    
#set up for investigation 3
    
    tabPanel("Investigation 3",
             fluidRow(
               column(
                 width = 4,
                 h4("Titration of a Diprotic Weak Acid or Weak Base"),
                 helpText(
                  "For the titration of a diprotic weak acid or a 
                  diprotic weak base, the shape and the position 
                  of the resulting titration curve is a function of 
                  five variables: the analyte's initial concentration, 
                  the initial volume of the analyte's solution, the 
                  analyte's two \\(\\textrm{p}{K}_{a}\\) values or its
                  two \\(\\textrm{p}{K}_{b}\\) values, and the 
                  titrant's concentration."),
                 helpText(
                  "The controls below allow you to define the conditions 
                  for the titration, including the option to include 
                  a visual indicator and to control the range of 
                  titrant volumes to plot on the \\(\\textit{x}\\)-axis; 
                  the resulting titration curve is shown on the far 
                  right. As you consider the effect of a variable on 
                  the titration curve, be sure to explore fully the range 
                  of its possible values and its interaction with 
                  other variables."
                  )
                 ),
               column(
                 width = 4,
                 h4("Questions"),
                 helpText(
                   "1. Explain how the five variables, both individually 
                   and collectively, determine the titration curve's shape, 
                   the location of the equivalence points along the 
                   \\(\\textit{x}\\)-axis, and the change in pH at the 
                   equivalence points."
                 ),
                 helpText(
                   "2. Which indicators are suitable for signaling the 
                   titration's two end points? Explain your reasoning."),
                 helpText(
                   "3. In the absence of an indicator, is the change in 
                   pH at the equivalence points sufficient for a useful 
                   quantitative analysis? Explain your reasoning."
                   )
               ),
               column(
                 width = 4,
                 plotOutput("plot_3a", height = "350px")
               )
                 ), 
             
             fluidRow(
               column(
                 width = 3,
                 h5("Analyte"),
                 radioButtons("radio_3a", label = NULL,
                              choices = c("weak acid", "weak base"),
                              selected = "weak acid", inline = TRUE),
                 sliderInput("slider_3c", "p\\({K}_{a}\\) or 
                             p\\({K}_{b}\\) values", min = 2, max = 12,
                             step = 0.01, value = c(5, 9), tick = FALSE),
                 helpText(
                  "The slider's ends correspond to the two
                   p\\({K}_{a}\\) values or to the two p\\({K}_{b}\\) 
                  values."
                  ),
                 sliderInput("slider_3a", "initial [analyte] (M)", 
                             min = 0.001, max = 0.25, step = 0.001, 
                             value = 0.10, ticks = FALSE),
                 sliderInput("slider_3d", "initial volume (mL)", 
                             min = 1, max = 50, value = 25, 
                             ticks = FALSE)
                 ),
               column(
                 width = 3,
                 h5("Titrant"),
                 helpText(
                   "To manually set the titrant's concentration, 
                   uncheck the checkbox."
                 ),
                 checkboxInput("checkbox_3a", 
                               "[titrant] = initial [analyte]?", 
                               value = TRUE),
                 sliderInput("slider_3b", "[titrant] (M)", min = 0.001,
                             max = 0.25, step = 0.001, value = 0.10,
                             ticks = FALSE),
                 radioButtons("radio_3b", "Range of volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 100 mL", inline = TRUE)
                 ),
               column(
                 width = 3,
                 h5("Indicator"),
                 radioButtons("radio_3c", "", choices =
                                c("none",
                                  "thymol blue: 1.2-2.8",
                                  "bromophenol blue: 3.0-4.6",
                                  "methyl red: 4.2-6.3",
                                  "bromothymol blue: 6.0-7.6",
                                  "cresol red: 7.2-8.8",
                                  "thymol blue: 8.0-9.6",
                                  "phenolphthalein: 8.3-10.0",
                                  "alizarin yellow R: 10.1-12.0"),
                              selected = "none"
                              )
               ),
               column(
                 width = 3
               )         
            )
          ), 
    
#set up for investigation 4
    
    tabPanel("Investigation 4",
             fluidRow(
               column(
                 width = 4,
                 h4("Titration of a Mixture of Weak Acids or Weak Bases"),
                 helpText(
                  "For the titration of a mixture that contains two 
                  monoprotic weak acids or two monoprotic weak bases, the 
                  shape and the position of the titration 
                  curve is a function of six variables: the first 
                  analyte's and the second analyte's concentration, the 
                  initial volume of the solution that contains the two
                  analytes, the p\\({K}_{a}\\) values or the 
                  p\\({K}_{b}\\) for the two analytes, and the 
                  titrant's concentration."
                 ),
                 helpText(
                  "The controls below allow you to define the conditions 
                  for the titration, including the option to include 
                  a visual indicator and to control the range of 
                  titrant volumes to plot on the \\(\\textit{x}\\)-axis; 
                  the resulting titration curve is shown on the far 
                  right. As you consider the effect of a variable on 
                  the titration curve, be sure to explore fully the range 
                  of its possible values and its interaction with 
                  other variables."
                )
               ),
               column(
                 width = 4,
                 h4("Questions"),
                 helpText(
                   "1. Explain how the six variables, both individually 
                   and collectively, determine the titration curve's shape, 
                   the location of the two equivalence points along the 
                   \\(\\textit{x}\\)-axis, and the change in pH at the 
                   equivalence points. In what ways is the titration 
                   curve for a mixture of two weak acids or two weak 
                   bases similar to and different from the titration 
                   curve for a diprotic weak acid or weak base?"
                 ),
                 helpText(
                    "2. Which indicators are suitable for signaling the 
                    titration's two end points? Explain your reasoning."),
                 helpText(
                   "3. In the absence of an indicator, is the change in 
                    pH at the two equivalence points sufficient for a 
                    useful quantitative analysis? Explain your reasoning."
                 )
               ),
               column(
                 width = 4,
                 plotOutput("plot_4a", height = "350px")
               )
             ),
             fluidRow(
               column(
                 width = 3,
                 h5("Analytes"),
                 radioButtons("radio_4a", label = NULL,
                              choices = c("weak acids", "weak bases"),
                              selected = "weak acids", inline = TRUE),
                 sliderInput("slider_4a", "initial [first analyte] (M)", 
                             min = 0.001, max = 0.25, step = 0.001, 
                             value = 0.10, ticks = FALSE),
                 sliderInput("slider_4c", "first analyte's p\\({K}_{a}\\) 
                              or p\\({K}_{b}\\) value", min = 2, 
                             max = 12, step = 0.01, 
                             value = 5, ticks = FALSE)
                 ),
               column(
                 width = 3,
                 br(),
                 br(),
                 sliderInput("slider_4d", "initial volume (mL)", 
                             min = 1, max = 50, value = 25, 
                             ticks = FALSE),
                 sliderInput("slider_4e", "initial [second analyte] (M)", 
                            min = 0.001, max = 0.25, step = 0.001, 
                            value = 0.10, ticks = FALSE),
                 sliderInput("slider_4f", "second analyte's p\\({K}_{a}\\) 
                              or p\\({K}_{b}\\) value", min = 2, 
                             max = 12, step = 0.01, value = 9,
                             ticks = FALSE)
                 ),
               column(
                 width = 3,
                 h5("Titrant"),
                 helpText(
                   "To manually set the titrant's concentration, 
                   uncheck the checkbox."
                 ),
                 checkboxInput("checkbox_4a", 
                               "[titrant] = initial [first analyte]?", 
                               value = TRUE),
                 sliderInput("slider_4b", "[titrant (M)]", min = 0.001, 
                             max = 0.25, step = 0.001, value = 0.10,
                             ticks = FALSE),
                 radioButtons("radio_4b", "Range of volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 100 mL", inline = TRUE)
                 
                ),
               column(
                 width = 3,
                 h5("Indicator"),
                 radioButtons("radio_4c", "", choices =
                                c("none",
                                  "thymol blue: 1.2-2.8",
                                  "bromophenol blue: 3.0-4.6",
                                  "methyl red: 4.2-6.3",
                                  "bromothymol blue: 6.0-7.6",
                                  "cresol red: 7.2-8.8",
                                  "thymol blue: 8.0-9.6",
                                  "phenolphthalein: 8.3-10.0",
                                  "alizarin yellow R: 10.1-12.0"),
                              selected = "none")
               )
             )
    ),
    
# set up for investigation 5
    
    tabPanel("Investigation 5",
             fluidRow(
               column(
                 width = 10,
                 h4("Practice Problems—Designing Titrations"),
                 helpText(
                  "For each of the following problems, design an 
                  acid-base titration that will allow you to 
                  determine the analyte's concentration. You can use 
                  the controls in Investigations 1-4 to help you 
                  determine a suitable set of conditions. In addition 
                  to any constraints included within each problem, and 
                  any constraints imposed by the controls in 
                  Investigations 1-4, your procedure must require no 
                  more than 50 mL of titrant and must use an initial 
                  volume of analyte of at least 25 mL. Assume you have 
                  access to the full range of volumetric glassware. 
                  Use your textbook, or other resources, to look up 
                  equilibrium constants. If you can use an indicator 
                  to signal the end point, then identify the indicator 
                  you will use; if not, then note that it is necessary
                  to monitor pH and record the titration curve. 
                  Prepare your answers in the form of a written 
                  procedure and explain how to calculate the
                  analyte's concentration."
                  ),
                 br(),
                 helpText(HTML(
                  "<b>Problem 1.</b> The monoprotic weak base guanine, 
                  C<sub>5</sub>H<sub>5</sub>N<sub>5</sub>O, is insoluble 
                  in water but fully soluble in acid. One way to 
                  determine the purity of guanine is to add a known 
                  amount to an excess of HCl and to then determine the 
                  amount of unreacted HCl by titrating it with a
                  standard solution of NaOH. Propose a set of conditions 
                  that will allow you to determine the purity of guanine;
                  you may assume that the samples have a purity that 
                  is at least 95% guanine.")),
                 br(),
                 helpText(HTML(
                  "<b>Problem 2.</b> The vinegar in your kitchen is a 
                  dilute solution of acetic acid, CH<sub>3</sub>COOH 
                  that typically is 4-8% w/v. Propose a set of conditions 
                  that will allow you to determine the concentration of 
                  acetic acid in samples of vinegar using NaOH as the 
                  titrant.")),
                 br(),
                 helpText(HTML(
                  "<b>Problem 3.</b> Household cleaners, such as Windex, 
                  typically are dilute solutions of 5-10% w/v NH<sub>3</sub>. 
                  Propose a set of conditions that will allow you to 
                  determine the concentration of ammonia in samples of 
                  a household cleaner using HCl as the titrant.")),
                 br(),
                 helpText(HTML(
                  "<b>Problem 4.</b> Suppose you have an impure sample 
                  of tartaric acid 
                  (C<sub>6</sub>H<sub>6</sub>O<sub>6</sub>; 
                  80% < purity < 95%) and that you 
                  plan to determine its purity by titrating it with a 
                  standard solution of NaOH. Propose a set of conditions 
                  that will allow you to determine the purity of your 
                  sample of tartaric acid.")),
                 br(),
                 helpText(HTML(
                  "<b>Problem 5.</b> Commercial washing soda is 30-40% w/w 
                  Na<sub>2</sub>CO<sub>3</sub>. Propose a set of 
                  conditions that will allow you to determine the purity 
                  of washing soda using HCl as the titrant.")),
                 br(),
                 helpText(HTML(
                  "<b>Problem 6.</b> Propose a set of conditions that 
                  will allow you to determine the concentration of acetic
                  acid and the concentration of ammonium chloride in a 
                  sample using NaOH as the titrant. Assume that the 
                  concentration of acetic acid is in the range 
                  0.20-0.40 M and that the concentration of piperidine 
                  is in the range 0.50-0.70 M."))
               )
             ),
             fluidRow(
               
             )
    ),

  tabPanel("Review",
           column(
             width = 6,
             h4("Summary"),
             HTML("<p>Having completed this learning module, you should 
                  have a good intuitive feel for how the shape, and, 
                  therefore, the practical usefulness of a 
                  titration curve depends on the relative acid/base 
                  strength of the analyte and the titrant, the relative 
                  concentrations of the analyte and the titrant, and 
                  the volume of the sample. You also should have a 
                  good intuitive feel for how to design an acid-base 
                  titration to solve a particular analytical problem."),
             h4("Additional Resources"),
             HTML("<p>You will find a more detailed discussion of the 
                  topics covered in this learning module in 
                  Chapter 9 of <em>Analytical Chemistry 2.0</em>, 
                  which is available using this 
                  <a href = http://bit.ly/1r3wJoz>link</a>.</p>"),
             HTML("<p>The titration curves in this learning module 
                  were generated using the titrationCurves package, 
                  which is available through 
                  <a href = https://cran.r-project.org/web/packages/titrationCurves/index.html                   >CRAN</a> or through 
                  <a href = https://github.com/dtharvey/TitrationApp>Github</a>; 
                  this package includes functions for generating a wide 
                  variety of titration curves, including acid-base 
                  titrations, complexation titrations, oxidation-
                  reduction titrations (using an oxidizing agent as 
                  the titrant), and precipitation titrations. Functions 
                  are included for plotting both normal, first 
                  derivative, and second derivative titration curves. 
                  The figure to the right, for example, shows the first 
                  derivative and the second derivative titration curves for the 
                  titration of 50 mL of a diprotic weak acid with a  
                  concentration of 0.10 M and p<em>K<sub>b</sub></em> 
                  values of 5 and 9 using a strong base titrant with a 
                  concentration of 0.10 M.</p>"),
             HTML("<p>A robust acid-base titration simulator written 
                  in Excel is available at 
                  <a href = http://www.iq.usp.br/gutz/Curtipot_.html>
                  CurTiPot</a>. In addition to simulating acid-base 
                  titration curves, the program also generates 
                  distribution diagrams and buffer plots.</p>")
           ),
           column(
             width = 6,
             br(),
             br(),
             br(),
             br(),
             br(),
             plotOutput("plot_reva")
           )
           )
    
# place new panels here
    
# end of tabset panel function

    ) 

# end of shiny UI 
 
)) 
