library(shiny)
library(titrationCurves)
library(shape)

shinyServer(function(input, output) {
  
# place files here that need to be sourced or code that runs once
# load file containing vectors for the acid colors, 
# base colors, acid limits, and base limits for six indicator options
  
  load(file = "indicator.RData")
  
# actions for investigation 1
  
  xlim_1 = reactive({
    if (input$radio_1b == "0 to 200 mL") {
      x = 200
      x
    } else if (input$radio_1b == "0 to 100 mL") {
      x = 100
      x
    } else {
      x = 50
      x
    }
  })
  
  ind_1 = reactive({
    if(input$radio_1c == "bromophenol blue: 3.0-4.6") {
      x = 1
      x
    } else if (input$radio_1c == "methyl red: 4.2-6.3") {
      x = 2
      x
    } else if (input$radio_1c == "bromothymol blue: 6.0-7.6") {
      x = 3
      x
    } else if (input$radio_1c == "cresol red: 7.2-8.8") {
      x = 4
      x
    } else if (input$radio_1c == "phenolphthalein: 8.3-10.0") {
      x = 5
      x
    } else if (input$radio_1c == "thymol blue: 1.2-2.8") {
      x = 7
      x
    } else if (input$radio_1c == "alizarin yellow R: 10.1-12.0") {
      x = 8
      x
    } else if (input$radio_1c == "thymol blue: 8.0-9.6") {
      x = 9
      x
    } else {  
      x = 6
      x
    }
  })
  
  output$plot_1a = renderPlot({
    if (input$radio_1a == "Strong Acid") {
      out = sa_sb(conc.acid = input$slider_1a, 
                  conc.base = input$slider_1b, 
                  vol.acid = input$slider_1d, 
                  plot = FALSE, eqpt = FALSE, overlay = FALSE)
      plot(out, xlim = c(0, xlim_1()), ylim = c(0, 14), 
           xaxp = c(0, xlim_1(), 10), xaxs = "i", yaxs = "i", type = "l", 
           lwd = 2, col = "blue", xlab = "volume of titrant (mL)", 
           ylab = "pH")
        ind.color = colorRampPalette(
          colors = c(acidColor[ind_1()], baseColor[ind_1()]),
          alpha = TRUE)(100)
        filledrectangle(
          mid = c(xlim_1()/2,(acidLimit[ind_1()] + 
                    baseLimit[ind_1()])/2), 
        wx = xlim_1(), wy = baseLimit[ind_1()] - 
          acidLimit[ind_1()], col = ind.color)
      grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
      # text(x = 2, y = c(13, 12, 11), 
      #      labels = c(paste("[titrant] =", input$slider_1b, "(M)"),
      #                 paste("[analyte] =", input$slider_1a, "(M)"),
      #                 paste("initial volume =", input$slider_1d, "(mL)")
      #                 ), pos = 4)
    } else {
      out = sb_sa(conc.acid = input$slider_1b, 
                  conc.base = input$slider_1a,
                  vol.base = input$slider_1d, 
                  plot = FALSE, eqpt = FALSE, overlay = FALSE)
      plot(out, xlim = c(0, xlim_1()), ylim = c(0, 14), 
           xaxp = c(0, xlim_1(), 10), xaxs = "i", yaxs = "i", type = "l", 
           lwd = 2, col = "blue", xlab = "volume of titrant (mL)", 
           ylab = "pH")
      ind.color = colorRampPalette(
        colors = c(acidColor[ind_1()], baseColor[ind_1()]),
        alpha = TRUE)(100)
      filledrectangle(
        mid = c(xlim_1()/2,(acidLimit[ind_1()] + 
                              baseLimit[ind_1()])/2), 
        wx = xlim_1(), wy = baseLimit[ind_1()] - 
          acidLimit[ind_1()], col = ind.color)
      grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
    }
  })

# actions for investigation 2 (note: because the wb_sa function takes
# the pKa of the weak base's conjugate weak acid, the slider's value
# for the analyte's pKb is converted to the corresponding pKa when
# calling the function)
  
  xlim_2 = reactive({
    if (input$radio_2b == "0 to 200 mL") {
      x = 200
      x
    } else if (input$radio_2b == "0 to 100 mL") {
      x = 100
      x
    } else {
      x = 50
      x
    }
  })
  
  ind_2 = reactive({
    if(input$radio_2c == "bromophenol blue: 3.0-4.6") {
      x = 1
      x
    } else if (input$radio_2c == "methyl red: 4.2-6.3") {
      x = 2
      x
    } else if (input$radio_2c == "bromothymol blue: 6.0-7.6") {
      x = 3
      x
    } else if (input$radio_2c == "cresol red: 7.2-8.8") {
      x = 4
      x
    } else if (input$radio_2c == "phenolphthalein: 8.3-10.0") {
      x = 5
      x
    } else if (input$radio_2c == "thymol blue: 1.2-2.8") {
      x = 7
      x
    } else if (input$radio_2c == "alizarin yellow R: 10.1-12.0") {
      x = 8
      x
    } else if (input$radio_2c == "thymol blue: 8.0-9.6") {
      x = 9
      x
    } else {  
      x = 6
      x
    }
  })
  
  output$plot_2a = renderPlot({
    if (input$radio_2a == "Weak Acid") {
    out = wa_sb(conc.acid = input$slider_2a, 
                conc.base = input$slider_2b, 
          pka = input$slider_2c, vol.acid = input$slider_2d, 
          plot = FALSE, eqpt = FALSE, overlay = FALSE)
    plot(out, xlim = c(0, xlim_2()), ylim = c(0, 14), 
         xaxp = c(0, xlim_2(), 10),
         xaxs = "i", yaxs = "i", type = "l", lwd = 2, col = "blue", 
         xlab = "volume of titrant (mL)", ylab = "pH")
    ind.color = colorRampPalette(
      colors = c(acidColor[ind_2()], baseColor[ind_2()]),
      alpha = TRUE)(100)
    filledrectangle(
      mid = c(xlim_2()/2,(acidLimit[ind_2()] + 
                            baseLimit[ind_2()])/2), 
      wx = xlim_2(), wy = baseLimit[ind_2()] - 
        acidLimit[ind_2()], col = ind.color)
    grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
    } else {
      out = wb_sa(conc.acid = input$slider_2b, 
                  conc.base = input$slider_2a,
            pka = 14 - input$slider_2c, vol.base = input$slider_2d, 
            plot = FALSE, eqpt = FALSE, overlay = FALSE)
      plot(out, xlim = c(0, xlim_2()), ylim = c(0, 14), 
           xaxp = c(0, xlim_2(), 10), xaxs = "i", yaxs = "i", type = "l", 
           lwd = 2, col = "blue", xlab = "volume of titrant (mL)", 
           ylab = "pH")
      ind.color = colorRampPalette(
        colors = c(acidColor[ind_2()], baseColor[ind_2()]),
        alpha = TRUE)(100)
      filledrectangle(
        mid = c(xlim_2()/2,(acidLimit[ind_2()] + 
                              baseLimit[ind_2()])/2), 
        wx = xlim_2(), wy = baseLimit[ind_2()] - 
          acidLimit[ind_2()], col = ind.color)
      grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
    }
  })
  
# actions for investigation 3 (note: because the diwb_sa function takes
# the pKas of the weak base's conjugate weak acids, the slider's values
# for the analyte's pKbs are converted to the corresponding pKas when
# calling the function)
  
  xlim_3 = reactive({
    if (input$radio_3b == "0 to 200 mL") {
      x = 200
      x
    } else if (input$radio_3b == "0 to 100 mL") {
      x = 100
      x
    } else {
      x = 50
      x
    }
  })
  
  ind_3 = reactive({
    if(input$radio_3c == "bromophenol blue: 3.0-4.6") {
      x = 1
      x
    } else if (input$radio_3c == "methyl red: 4.2-6.3") {
      x = 2
      x
    } else if (input$radio_3c == "bromothymol blue: 6.0-7.6") {
      x = 3
      x
    } else if (input$radio_3c == "cresol red: 7.2-8.8") {
      x = 4
      x
    } else if (input$radio_3c == "phenolphthalein: 8.3-10.0") {
      x = 5
      x
    } else if (input$radio_3c == "thymol blue: 1.2-2.8") {
      x = 7
      x
    } else if (input$radio_3c == "alizarin yellow R: 10.1-12.0") {
      x = 8
      x
    } else if (input$radio_3c == "thymol blue: 8.0-9.6") {
      x = 9
      x
    } else {  
      x = 6
      x
    }
  })
  
  output$plot_3a = renderPlot({
    if (input$radio_3a == "Weak Acid") {
        out = diwa_sb(conc.acid = input$slider_3a, 
                      conc.base = input$slider_3b,
                  pka1 = input$slider_3c[1], pka2 = input$slider_3c[2],
                  vol.acid = input$slider_3d, plot = FALSE, 
                  eqpt = FALSE, overlay = FALSE)
        plot(out, xlim = c(0, xlim_3()), ylim = c(0, 14), 
             xaxp = c(0, xlim_3(), 10), xaxs = "i", yaxs = "i", type = "l", 
             lwd = 2, col = "blue", xlab = "volume of titrant (mL)", 
             ylab = "pH")
        ind.color = colorRampPalette(
          colors = c(acidColor[ind_3()], baseColor[ind_3()]),
          alpha = TRUE)(100)
        filledrectangle(
          mid = c(xlim_3()/2,(acidLimit[ind_3()] + 
                                baseLimit[ind_3()])/2), 
          wx = xlim_3(), wy = baseLimit[ind_3()] - 
            acidLimit[ind_3()], col = ind.color)
        grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
    } else {
      out = diwb_sa(conc.acid = input$slider_3b, 
                    conc.base = input$slider_3a,
                    pka1 = 14 - input$slider_3c[2], 
                    pka2 = 14 - input$slider_3c[1],
                    vol.base = input$slider_3d, plot = FALSE, 
                    eqpt = FALSE, overlay = FALSE)
      plot(out, xlim = c(0, xlim_3()), ylim = c(0, 14), 
           xaxp = c(0, xlim_3(), 10), xaxs = "i", yaxs = "i", type = "l", 
           lwd = 2, col = "blue", xlab = "volume of titrant (mL)", 
           ylab = "pH")
      ind.color = colorRampPalette(
        colors = c(acidColor[ind_3()], baseColor[ind_3()]),
        alpha = TRUE)(100)
      filledrectangle(
        mid = c(xlim_3()/2,(acidLimit[ind_3()] + 
                              baseLimit[ind_3()])/2), 
        wx = xlim_3(), wy = baseLimit[ind_3()] - 
          acidLimit[ind_3()], col = ind.color)
      grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
    }
  })
  
# actions for investigation 4 (note: because the wbmix_sa function takes
# the pKas of the weak bases' conjugate weak acids, the sliders' values
# for the analytes' pKbs are converted to the corresponding pKas when
# calling the function)
  
  xlim_4 = reactive({
    if (input$radio_4b == "0 to 200 mL") {
      x = 200
      x
    } else if (input$radio_4b == "0 to 100 mL") {
      x = 100
      x
    } else {
      x = 50
      x
    }
  })
  
  ind_4 = reactive({
    if(input$radio_4c == "bromophenol blue: 3.0-4.6") {
      x = 1
      x
    } else if (input$radio_4c == "methyl red: 4.2-6.3") {
      x = 2
      x
    } else if (input$radio_4c == "bromothymol blue: 6.0-7.6") {
      x = 3
      x
    } else if (input$radio_4c == "cresol red: 7.2-8.8") {
      x = 4
      x
    } else if (input$radio_4c == "phenolphthalein: 8.3-10.0") {
      x = 5
      x
    } else if (input$radio_4c == "thymol blue: 1.2-2.8") {
      x = 7
      x
    } else if (input$radio_4c == "alizarin yellow R: 10.1-12.0") {
      x = 8
      x
    } else if (input$radio_4c == "thymol blue: 8.0-9.6") {
      x = 9
      x
    } else {  
      x = 6
      x
    }
  })
  
  output$plot_4a = renderPlot({
    if (input$radio_4a == "Weak Acids") {
      out = wamix_sb(conc.acid1 = input$slider_4a, 
                     conc.acid2 = input$slider_4e,
                     conc.base = input$slider_4b,
                    pka1 = input$slider_4c, pka2 = input$slider_4f,
                    vol.acid = input$slider_4d, plot = FALSE, 
                    eqpt = FALSE, overlay = FALSE)
      plot(out, xlim = c(0, xlim_4()), ylim = c(0, 14), 
           xaxp = c(0, xlim_4(), 10), xaxs = "i", yaxs = "i", type = "l", 
           lwd = 2, col = "blue", xlab = "volume of titrant (mL)", 
           ylab = "pH")
      ind.color = colorRampPalette(
        colors = c(acidColor[ind_4()], baseColor[ind_4()]),
        alpha = TRUE)(100)
      filledrectangle(
        mid = c(xlim_4()/2,(acidLimit[ind_4()] + 
                              baseLimit[ind_4()])/2), 
        wx = xlim_4(), wy = baseLimit[ind_4()] - 
          acidLimit[ind_4()], col = ind.color)
      grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
    } else {
      out = wbmix_sa(conc.acid = input$slider_4b, 
                     conc.base1 = input$slider_4a,
                     conc.base2 = input$slider_4e,
                    pka1 = 14 - input$slider_4c, 
                    pka2 = 14 - input$slider_4f,
                    vol.base = input$slider_4d, plot = FALSE, 
                    eqpt = FALSE, overlay = FALSE)
      plot(out, xlim = c(0, xlim_4()), ylim = c(0, 14), 
           xaxp = c(0, xlim_4(), 10), xaxs = "i", yaxs = "i", type = "l", 
           lwd = 2, col = "blue", xlab = "volume of titrant (mL)", 
           ylab = "pH")
      ind.color = colorRampPalette(
        colors = c(acidColor[ind_4()], baseColor[ind_4()]),
        alpha = TRUE)(100)
      filledrectangle(
        mid = c(xlim_4()/2,(acidLimit[ind_4()] + 
                              baseLimit[ind_4()])/2), 
        wx = xlim_4(), wy = baseLimit[ind_4()] - 
          acidLimit[ind_4()], col = ind.color)
      grid(nx = 10, ny = 7, lwd = 1, col = "wheat4")
    }
  })

# end of shiny server function
  
}) 
