package com.fibonacci.web;

import java.awt.*;
import java.awt.geom.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import javax.imageio.ImageIO;
import java.util.Base64;

public class FibonacciCurve {
    private static final int PADDING = 12; 
    private static final int IMG_W = 800;
    private static final int IMG_H = 600;

   
    public String generateCurve() throws Exception {
        return generateCurve(10);
    }

    
    public String generateCurve(int terms) throws Exception {
        if (terms < 1) terms = 1;
        if (terms > 1000) terms = 1000;

        int width = IMG_W, height = IMG_H;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = image.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

     
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);

    
    double aspect = (double)(IMG_W - 2 * PADDING) / (IMG_H - 2 * PADDING);
    
    double boxHalfHeight = 13.0; 
    double boxHalfWidth = boxHalfHeight * aspect;
    double xMin = -boxHalfWidth, xMax = boxHalfWidth;
    double yMin = -boxHalfHeight, yMax = boxHalfHeight;

    double xScale = (width - 2.0 * PADDING) / (xMax - xMin);
    double yScale = (height - 2.0 * PADDING) / (yMax - yMin);

      
        final int pad = PADDING;

      
        g.setColor(new Color(230, 230, 230));
        g.setStroke(new BasicStroke(1));
       
        for (double xv = xMin; xv <= xMax + 0.001; xv += 2.0) {
            int sx = (int)Math.round(pad + (xv - xMin) * xScale);
            g.drawLine(sx, pad, sx, height - pad);
        }
        
        for (double yv = yMin; yv <= yMax + 0.001; yv += 5.0) {
            int sy = (int)Math.round(height - pad - (yv - yMin) * yScale);
            g.drawLine(pad, sy, width - pad, sy);
        }

       
        g.setColor(Color.BLACK);
        g.setStroke(new BasicStroke(1));
       
        if (yMin <= 0 && yMax >= 0) {
            int sy0 = (int)Math.round(height - pad - (0 - yMin) * yScale);
            g.drawLine(pad, sy0, width - pad, sy0);
        }
       
        if (xMin <= 0 && xMax >= 0) {
            int sx0 = (int)Math.round(pad + (0 - xMin) * xScale);
            g.drawLine(sx0, pad, sx0, height - pad);
        }

        
        g.setFont(new Font("Arial", Font.PLAIN, 12));
    FontMetrics fm = g.getFontMetrics();

   
    int syAxis = (int)Math.round(height - pad - (0 - yMin) * yScale);

   
    int bottomLabelY = Math.min(height - 4, syAxis + fm.getAscent() + 12);
        for (double xv = xMin; xv <= xMax + 0.001; xv += 2.0) {
            int sx = (int)Math.round(pad + (xv - xMin) * xScale);
            
            int tickTop = Math.max(pad, syAxis - 2);
            int tickBottom = Math.min(height - 2, syAxis + 8);
            g.drawLine(sx, tickTop, sx, tickBottom);

            String lbl = String.format("%.0f", xv);
            g.drawString(lbl, sx - fm.stringWidth(lbl)/2, bottomLabelY);
        }
        
            int yAxisXCoord = (int)Math.round(pad + (0 - xMin) * xScale);
                for (double yv = yMin; yv <= yMax + 0.001; yv += 2.0) {
                    int sy = (int)Math.round(height - pad - (yv - yMin) * yScale);
                    String lbl = String.format("%.0f", yv);
                    
                    int tickHalf = 4;
                    g.drawLine(yAxisXCoord - tickHalf, sy, yAxisXCoord + tickHalf, sy);
                   
                    int sxLeft = Math.max(pad, yAxisXCoord - 8 - fm.stringWidth(lbl));
                    g.drawString(lbl, sxLeft, sy + fm.getAscent()/2 - 2);
                }


    g.setFont(new Font("Arial", Font.PLAIN, 12));
   
    int xTitleY = Math.min(height - 2, bottomLabelY + fm.getAscent() + 6);
    g.drawString("X-axis (one unit)", width - PADDING - 120, xTitleY);

   
    int yAxisXCoordForTitle = (int)Math.round(pad + (0 - xMin) * xScale);
    int yTitleX = Math.max(PADDING, yAxisXCoordForTitle - fm.stringWidth("Y-axis (one unit)") - 12);
    g.drawString("Y-axis (one unit)", yTitleX, PADDING + 18);

  
    String legendText = "Fibonacci spiral";
    g.setFont(new Font("Arial", Font.PLAIN, 12));
    FontMetrics legendFm = g.getFontMetrics();
    int textW = legendFm.stringWidth(legendText);
    int textH = legendFm.getHeight();
    int paddingX = 8;
    int paddingY = 4;
    int lineGap = 14;

    int rectW = textW + paddingX * 2 + lineGap;
    int rectH = textH + paddingY * 2;
    int rectX = IMG_W - PADDING - rectW;
    int rectY = PADDING + 8;

    g.setColor(new Color(245,245,245));
    g.fillRoundRect(rectX, rectY, rectW, rectH, 6, 6);
    g.setColor(Color.BLACK);
    g.drawRoundRect(rectX, rectY, rectW, rectH, 6, 6);

    
    g.setColor(Color.RED);
    g.setStroke(new BasicStroke(2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
    int ly = rectY + rectH/2;
    int lx1 = rectX + paddingX;
    int lx2 = rectX + paddingX + lineGap - 4;
    g.drawLine(lx1, ly, lx2, ly);

   
    g.setColor(Color.BLACK);
    int tx = rectX + paddingX + lineGap;
    int ty = rectY + paddingY + legendFm.getAscent();
    g.drawString(legendText, tx, ty);

       
        ArrayList<Integer> fib = new ArrayList<>();
        fib.add(1);
        if (terms > 1) fib.add(1);
        for (int i = 2; i < terms; i++) {
            fib.add(fib.get(i-1) + fib.get(i-2));
        }

        
        double phi = (1.0 + Math.sqrt(5.0)) / 2.0; 
        double b = 2.0 * Math.log(phi) / Math.PI; 
        double thetaMax = terms * Math.PI / 2.0;

   
    double rMax = Math.exp(b * thetaMax);
    double availRad = Math.min((width - 2.0 * pad), (height - 2.0 * pad)) / 2.0;
    
    double baseRadialScale = (availRad * 0.95) / rMax;
    
    double desiredMultiplier = 1.0 + Math.min(0.45, (terms - 1) * 0.03);
    double maxMultiplier = 1.15;
    double scaleMultiplier = Math.min(desiredMultiplier, maxMultiplier);
    double radialScale = baseRadialScale * scaleMultiplier;

   
    double cx = pad + (0 - xMin) * xScale;
    double cy = height - pad - (0 - yMin) * yScale;

    
    g.setColor(Color.RED);
        g.setStroke(new BasicStroke(3.0f));
        Path2D.Double path = new Path2D.Double();

        boolean firstPoint = true;
        
        double rotation = Math.PI; 

        for (double theta = 0.0; theta <= thetaMax; theta += 0.01) {
            double r = Math.exp(b * theta);
            double rp = r * radialScale; // in pixels

            double sx = cx + rp * Math.cos(theta + rotation);
            double sy = cy - rp * Math.sin(theta + rotation);

            if (firstPoint) {
                path.moveTo(sx, sy);
                firstPoint = false;
            } else {
                path.lineTo(sx, sy);
            }
        }

        g.draw(path);

        g.dispose();

        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(image, "png", os);
        return Base64.getEncoder().encodeToString(os.toByteArray());
    }

}
