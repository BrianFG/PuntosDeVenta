package graficas;


import javax.swing.JFrame;
 
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
 
public class BarChart extends JFrame {
 
 private static final long serialVersionUID = 1L;
 
 public BarChart(String applicationTitle, String chartTitle) {
  super(applicationTitle);
  // Creamos el conjunto de datos con las votaciones
  DefaultCategoryDataset dataset = createDataset();
 
  JFreeChart chart = createChart(dataset, chartTitle);
  // Ponemos el gráfico en un panel
  ChartPanel chartPanel = new ChartPanel(chart);
  // Dejamos el tamaño por defecto
  chartPanel.setPreferredSize(new java.awt.Dimension(500, 270));
  // Lo añadimos a nuestra aplicación (PieChart)
  setContentPane(chartPanel);
 
 }
 
 /**
  * Creates a sample dataset
  */
 
 private DefaultCategoryDataset createDataset() {
  DefaultCategoryDataset result = new DefaultCategoryDataset();
   
  result.setValue(186, "PP", "2011");
  result.setValue(110, "PSOE", "2011");
  result.setValue(16, "CIU", "2011");
  result.setValue(11, "IU-LV", "2011");
  result.setValue(7, "AMAIUR", "2011");
  result.setValue(5, "UPyD", "2011");
  result.setValue(5, "EAJ-PNV", "2011");
  result.setValue(3, "ERC", "2011");
  result.setValue(2, "BNG", "2011");
   
  result.setValue(154, "PP", "2008");
  result.setValue(169, "PSOE", "2008");
  result.setValue(10, "CIU", "2008");
  result.setValue(2, "IU-LV", "2008");
  result.setValue(0, "AMAIUR", "2008");
  result.setValue(1, "UPyD", "2008");
  result.setValue(6, "EAJ-PNV", "2008");
  result.setValue(3, "ERC", "2008");
  result.setValue(2, "BNG", "2008");
   
  return result;
 
 }
 
 /**
  * Creates a chart
  */
 
 private JFreeChart createChart(DefaultCategoryDataset dataset, String title) {
 
  JFreeChart chart = ChartFactory.createBarChart3D(title, "Partido",
    "Escaños", dataset, // data
    PlotOrientation.VERTICAL, true, // include legend
    true, false);
  CategoryPlot plot = (CategoryPlot) chart.getPlot();
  CategoryAxis xAxis = (CategoryAxis) plot.getDomainAxis();
  xAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45); // Inclinamos 45 grados las etiquetas del eje X 
  plot.setBackgroundAlpha(0.5f);
  return chart;
 
 }
 
 public static void main(String[] args) {
  BarChart demo = new BarChart("Elecciones Generales 2011",
    "Escaños obtenidos por partido");
  demo.pack();
  demo.setVisible(true);
 }
}
