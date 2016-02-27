# TitrationApp

This learning module provides an introduction to acid-base titrimetry that is suitable for an introductory course in analytical chemistry. 
It is assumed that students are comfortable with stoichiometric calculations, particularly as they apply to the reactions of acids and 
bases during a titration, and that they appreciate the difference between a titration's equivalence point and its end point. The module 
consists of five investigations:

* Investigation 1: Titration of a Strong Acid or Strong Base
* Investigation 2: Titration of a Monoprotic Weak Acid or Weak Base
* Investigation 3: Titration of a Diprotic Weak Acid or Weak Base
* Investigation 4: Titration of a Mixture of Weak Acids or Weak Bases
* Investigation 5: Practice Problems--Designing Titrations

The learning module is programmed in R (www.r-project.org) using the Shiny package, which allows for interactive features. Each 
investigation includes a brief introduction and some suggestions of things to explore and/or questions to answer. The controls, which 
consist of a combination of radio buttons and sliders, allow the user to choose the chemical form of the analyte and, by default, the 
titrant, along with their concentrations, and, where appropriate, to specify pKa or pKb values. Additional controls are 
available to adjust the limits for the volume axis and to overlay the pH range for selected indicators. The resulting titration curve 
is updated with each change in a control's value.
