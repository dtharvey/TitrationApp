library(shiny)
library(titrationCurves)
library(shape)

# initial set up

shinyUI(fluidPage(
  withMathJax(),
  tags$style(HTML("
                  p {
                  font-size: 18px;
                  font-weight: bold;
                  }
  
                  h4 {
                  font-size: 18px;
                  }

                  ")),
  
  tabsetPanel(
    
# set up for home page
    
    tabPanel("Home",
             column(
               width = 10,
               offset = 1,
               h1("Introduction to Acid-Base Titrations", 
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
                    in color signals the titration's end point; if all 
                    is well, the difference between the experimental 
                    end point and the theoretical equivalence point is 
                    sufficiently small that it does not affect the 
                    accuracy of the analysis. Because we know the 
                    concentration and volume of titrant, we can determine
                    the moles of analyte in the original sample. In this 
                    learning module we take a closer look at acid-base 
                    titrimetry using the following series of 
                    investigations:</p>"),
               HTML("<ul> 
                    <li> 
                    <h4>Investigation 1: Titration of a Strong Acid
                      or a Strong Base</h4>
                    </li>
                    <li> 
                    <h4>Investigation 2: Titration of a Monoprotic
                      Weak Acid or Weak Base</h4>
                    </li>
                    <li> 
                    <h4>Investigation 3: Titration of a Diprotic Weak
                      Acid or Weak Base</h4>
                    </li>
                    <li> 
                    <h4>Investigation 4: Titration of a Mixture of Weak
                      Acids or Weak Bases</h4>
                    <li>
                    <h4>Investigation 5: Practive Problems—Designing
                      Titrations</h4>
                    </li>
                    </ul>"),
               HTML("<p>In the first four investigations you will explore
                    the effect on a titration curve of the analyte's and
                    the titrant's properties, including variables such as
                    concentration and p<em>K<sub>a</em></sub> or 
                    p<em>K<sub>b</sub></em> values. You also will consider
                    the utility of acid-base indicators in signaling a 
                    titration's end point. The last investigation provides
                    you with the opportunity to design a titration to 
                    solve a particular analytical problem.</p>"),
               HTML("<p>For a more detailed discussion of the topics
                    covered in this learning module, you can consult 
                    Chapter 9 of <em>Analytical Chemistry 2.0</em>, 
                    which is available using this 
                    <a href = http://bit.ly/1r3wJoz>link</a>.</p>")
             )
            ),
    
# set up for investigation 1
    
    tabPanel("Investigation 1",
             fluidRow(
               column(
                 width = 5, offset = 1,
                 h4("Titration of a Strong Acid or Strong Base"),
                 helpText("For the titration of a strong acid 
                      with a strong base, or for the titration of
                      a strong base with a strong acid, 
                      the shape and the position of the resulting 
                      titration curve is a function of three 
                      variables:"),
                 helpText(HTML("<ul>
                      <li>the analyte's concentration
                      </li>
                      <li>the initial volume of the analyte's solution
                      </li>
                      <li>the titrant's concentration
                      </li>
                      </ul>")),
                 helpText("Using the controls below and the resulting
                      titration curve displayed on the right, explore 
                      the effect of each variable on the shape and  
                      the position of the titration curve for a strong 
                      acid analyte and for a strong base analyte. To what 
                      extent, if any, do the three variables interact 
                      to determine the shape and/or 
                      the position of the titration curve? If you choose
                      to use an indicator to signal the titration's end
                      point, what factors affect your selection of an 
                      indicator? In the absence of a suitable indicator,
                      does the change in pH at the equivalence point 
                      allow for a useful quantitative analysis?")
               ),
               column(
                 width = 5,
                 align = "left",
                 plotOutput("plot_1a", height = "350px")
               )
             ),
             fluidRow(
               column(
                 width = 3,
                 align = "left",
                 radioButtons("radio_1a", "Analyte is...",
                              choices = c("Strong Acid", "Strong Base"),
                              selected = "Strong Acid", inline = TRUE),
                 radioButtons("radio_1b", "Range of volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 200 mL", inline = TRUE),
                 radioButtons("radio_1c", "Indicator is...", choices =
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
                 width = 3,
                 helpText("Adjust titrant's concentration and  
                          initial volume of the analyte's solution."),
                 sliderInput("slider_1b", "[titrant] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.10),
                 sliderInput("slider_1d", "initial volume (mL)", 
                             min = 5, max = 50, value = 50)
               ),
               column(
                 width = 3,
                 helpText("Adjust  analyte's initial concentration."),
                 sliderInput("slider_1a", "[analyte] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.25)
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
                 width = 5, offset = 1,
                 h4("Titration of a Monoprotic Weak Acid or Weak Base"),
                 helpText("For the titration of a monoprotic weak acid 
                      with a strong base, or for the titration of
                      a monoprotic weak base with a strong acid, 
                      the shape and the position of the resulting 
                      titration curve is a function of four 
                      variables:"),
                 helpText(HTML("<ul>
                      <li>the concentration of the analyte
                      </li>
                      <li>the initial volume of the analyte
                      </li>
                      <li>the concentration of the titrant
                      </li>
                      <li>the analyte's p<em>K<sub>a</em></sub> 
                        value or its p<em>K<sub>b</sub></em> value
                      </li>
                      </ul>")),
                 helpText("Using the controls below and the resulting
                      titration curve displayed on the right, explore 
                      the effect of each variable on the shape and  
                      the position of the titration curve for a weak 
                      acid analyte and for a weak base analyte. To what 
                      extent, if any, do the four variables interact 
                      to determine the shape and/or 
                      the position of the titration curve? If you choose
                      to use an indicator to signal the titration's end
                      point, what factors affect your selection of an 
                      indicator? In the absence of a suitable indicator,
                      does the change in pH at the equivalence point 
                      allow for a useful quantitative analysis?")
                 ),
               column(
                 width = 5,
                 align = "left",
                 plotOutput("plot_2a", height = "350px")
               )
               ), 
             
             fluidRow(
               column(
                 width = 3,
                 align = "left",
                 radioButtons("radio_2a", "Analyte is...",
                              choices = c("Weak Acid", "Weak Base"),
                              selected = "Weak Acid", inline = TRUE),
                 radioButtons("radio_2b", "Range of volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 200 mL", inline = TRUE),
                 radioButtons("radio_2c", "Indicator is...", choices =
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
                 width = 3,
                 helpText("Adjust  titrant's concentration and  
                          initial volume of the analyte's solution."),
                 sliderInput("slider_2b", "[titrant] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.10),
                 sliderInput("slider_2d", "initial volume (mL)", 
                             min = 5, max = 50, value = 50)
               ),
               column(
                 width = 3,
                 helpText(HTML("Adjust  analyte's initial concentration 
                      and its p<em>K<sub>a</sub></em> or its 
                      p<em>K<sub>b</sub></em> value.")),
                 sliderInput("slider_2a", "[analyte] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.25),
                 sliderInput("slider_2c", "p\\({K}_{a}\\) or 
                             p\\({K}_{b}\\)", min = 2, max = 12,
                             step = 0.01, value = 7)
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
                 width = 5, offset = 1,
                 h4("Titration of a Diprotic Weak Acid or Weak Base"),
                 helpText("For the titration of a diprotic weak acid 
                      with a strong base, or for the titration of
                      a diprotic weak base with a strong acid, 
                      the shape and the position of the resulting 
                      titration curve is a function of five 
                      variables:"),
                 helpText(HTML("<ul>
                      <li>the analyte's concentration
                      </li>
                      <li>the initial volume of the analyte's solution
                      </li>
                      <li>the titrant's concentration
                      </li>
                      <li>the analyte's two p<em>K<sub>a</em></sub> 
                      values or its two p<em>K<sub>b</sub></em> values
                      </li>
                      </ul>")),
                 helpText("Using the controls below and the resulting
                      titration curve displayed on the right, explore 
                      the effect of each variable on the shape and  
                      the position of the titration curve for a diprotic  
                      weak acid analyte and for a diprotic weak base 
                      analyte. To what extent, if any, do the five 
                      variables interact to determine 
                      the shape and/or the position of the titration 
                      curve? If you choose
                      to use an indicator to signal the titration's end
                      point, what factors affect your selection of an 
                      indicator? In the absence of a suitable indicator,
                      does the change in pH at the equivalence point 
                      allow for a useful quantitative analysis?")
                 ),
               column(
                 width = 5,
                 align = "left",
                 plotOutput("plot_3a", height = "350px")
               )
                 ), 
             
             fluidRow(
               column(
                 width = 3,
                 align = "left",
                 radioButtons("radio_3a", "Analyte is...",
                              choices = c("Weak Acid", "Weak Base"),
                              selected = "Weak Acid", inline = TRUE),
                 radioButtons("radio_3b", "Range of volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 200 mL", inline = TRUE),
                 radioButtons("radio_3c", "Indicator is...", choices =
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
                 width = 3,
                 helpText("Adjust  titrant's concentration and  
                      initial volume of analyte's solution."),
                 sliderInput("slider_3b", "[titrant] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.10),
                 sliderInput("slider_3d", "initial volume (mL)", 
                             min = 5, max = 50, value = 25)
                 ),
               column(
                 width = 3,
                 helpText(HTML("Adjust  analyte's initial 
                      concentration and its p<em>K<sub>a</sub></em> or 
                      its p<em>K<sub>b</sub></em> values. The slider's 
                      two ends correspond to the two
                      p<em>K<sub>a</sub></em> values or to the two 
                      p<em>K<sub>b</sub></em> values. If you click on the 
                      slider between the limits, you can change both
                      p<em>K<sub>a</sub></em> or p<em>K<sub>b</sub></em>
                      values while maintaining a fixed difference
                      between them.</p>")),
                 sliderInput("slider_3a", "[analyte] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.25),
                 sliderInput("slider_3c", "p\\({K}_{a}\\) or 
                             p\\({K}_{b}\\) values", min = 2, max = 12,
                             step = 0.01, value = c(5, 9))
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
                 width = 5, offset = 1,
                 h4("Titration of a Mixture of Weak Acids or Weak Bases"),
                 helpText("For the titration of a mixture that contains
                      two monoprotic weak acids, or for the titration of
                      a mixture that contains two monoprotic weak bases,
                      the shape and the position of the resulting 
                      titration curve is a function of six 
                      variables:"),
                 helpText(HTML("<ul>
                      <li>the first analyte's and the second analyte's 
                          concentration
                      <li>the initial volume of the solution that
                      contains the two analytes
                      </li>
                      <li>the titrant's concentration
                      </li>
                      <li>the p<em>K<sub>a</em></sub> 
                      values or the p<em>K<sub>b</sub></em> values 
                      for the two analytes
                      </li>
                      </ul>")),
                 helpText("Using the controls below and the resulting
                      titration curve displayed on the right, explore 
                      the effect of each variable on the shape and  
                      the position of the titration curve for a   
                      mixture of weak acid analytes and for a mixture 
                      of weak base analytes. To what extent, if any, 
                      do the six variables interact to 
                      determine the shape and/or the position of the 
                      titration curve? If you choose
                      to use an indicator to signal the titration's end
                      point, what factors affect your selection of an 
                      indicator? In the absence of a suitable indicator,
                      does the change in pH at the equivalence point 
                      allow for a useful quantitative analysis?")
               ),
               column(
                 width = 5,
                 align = "left",
                 plotOutput("plot_4a", height = "350px")
               )
             ),
             fluidRow(
               column(
                 width = 3,
                 align = "left",
                 radioButtons("radio_4a", "Analytes are...",
                              choices = c("Weak Acids", "Weak Bases"),
                              selected = "Weak Acids", inline = TRUE),
                 radioButtons("radio_4b", "Range of volumes...",
                              choices = c("0 to 200 mL", "0 to 100 mL",
                                          "0 to 50 mL"), selected = 
                                "0 to 200 mL", inline = TRUE),
                 radioButtons("radio_4c", "Indicator is...", choices =
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
                 width = 3,
                 helpText("Adjust  titrant's concentration  
                      and the initial volume of the analyte's solution."),
                 sliderInput("slider_4b", "[titrant] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.10),
                 sliderInput("slider_4d", "initial volume (mL)", 
                             min = 5, max = 50, value = 25)
                 ),
               column(
                 width = 3,
                 helpText(HTML("Adjust first analyte's initial 
                      concentration and its p<em>K<sub>a</sub></em> or 
                      its p<em>K<sub>b</sub></em> value.")),
                 sliderInput("slider_4a", "[analyte] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.25),
                 sliderInput("slider_4c", "p\\({K}_{a}\\) or 
                             p\\({K}_{b}\\) value", min = 2, max = 12,
                             step = 0.01, value = 5)
                 ),
               column(
                 width = 3,
                 helpText(HTML("Adjust second analyte's initial 
                      concentration and its p<em>K<sub>a</sub></em> or 
                      its p<em>K<sub>b</sub></em> value.")),
                 sliderInput("slider_4e", "[analyte] (M)", min = 0.05,
                             max = 0.25, step = 0.005, value = 0.25),
                 sliderInput("slider_4f", "p\\({K}_{a}\\) or 
                             p\\({K}_{b}\\) value", min = 2, max = 12,
                             step = 0.01, value = 9)
                )
             )
    ),
    
# set up for investigation 5
    
    tabPanel("Investigation 5",
             fluidRow(
               column(
                 width = 10,
                 h4("Practice Problems—Designing Titrations"),
                 helpText("For each of the following problems, design
                          an acid-base titration that will allow you to 
                          determine the analyte's concentration. You 
                          can use the controls in Investigations 1-4
                          to help you determine a suitable set of 
                          conditions. In addition to any constraints 
                          included within each problem and any constraints
                          imposed by the controls in Investigations 1-4, 
                          your procedure must require no more than 50 mL
                          of titrant and must use an initial volume of
                          analyte of at least 25 mL. Assume you have 
                          access to the full range of volumetric 
                          glassware. Use your textbook, or other 
                          resources, to look up equilibrium constants. 
                          If you can use an indicator to signal the end
                          point, then identify the indicator you will 
                          use; if not, then note that it is necessary
                          to monitor pH and record the titration curve. 
                          Prepare your answers in the form of a written 
                          procedure and explain how to calculate the
                          analyte's concentration."),
                 br(),
                 helpText(HTML("<b>Problem 1.</b> The monoprotic weak
                               base guanine, C<sub>5</sub>H<sub>5</sub>
                               N<sub>5</sub>O, is insoluble in water
                               but fully soluble in acid. One way to 
                               determine the purity of guanine is to
                               add a known amount to an excess of HCl
                               and to then determine the amount of
                               unreacated HCl by titrating it with a
                               standard solution of NaOH. Propose a
                               set of conditions that will allow you
                               to determine the purity of guanine;
                               you may assume that the samples are at
                               least 95% guanine.")),
                 br(),
                 helpText(HTML("<b>Problem 2.</b> The vinegar in your
                               kitchen is a dilute solution of acetic
                               acid, CH<sub>3</sub>COOH that typically 
                               is 4-8% w/v. Propose a set of conditions 
                               that will allow you to determine the 
                               concentration of acetic acid in samples 
                               of vinegar using NaOH as the titrant.")),
                 br(),
                 helpText(HTML("<b>Problem 3.</b> Household cleaners,
                               such as Windex, typically are dilute 
                               solutions of 5-10% w/v NH<sub>3</sub>. 
                               Propose a set of conditions that will 
                               allow you to determine the concentration 
                               of ammonia in samples of a household 
                               cleaner using HCl as the titrant.")),
                 br(),
                 helpText(HTML("<b>Problem 4.</b> Suppose you have an
                               impure sample of tartaric acid (80% < 
                               purity < 95%) and that you plan to determine
                               its purity by titrating it with a 
                               standard solution of NaOH. Propose a set
                               of conditions that will allow you to
                               determine the purity of your sample of 
                               tartaric acid.")),
                 br(),
                 helpText(HTML("<b>Problem 5.</b> Commercial washing
                               soda is 30-40% w/w 
                               Na<sub>2</sub>CO<sub>3</sub>. Propose
                               a set of conditions that will allow you
                               to determine the purity of washing 
                               soda using HCl as the titrant.")),
                 br(),
                 helpText(HTML("<b>Problem 6.</b> Propose a set of 
                               conditions that will allow you to 
                               determine the concentration of acetic
                               acid and the concentration of ammonium 
                               chloride in a sample using NaOH as the 
                               titrant. Assume that the concentration 
                               of acetic acid is in the range 
                               0.20-0.40 M and that the concentration 
                               of piperidine is in the range 0.50-0.70 M."))
               )
             ),
             fluidRow(
               
             )
    )
    
# place new panels here
    
# end of tabset panel function

    ) 

# end of shiny UI 
 
)) 
