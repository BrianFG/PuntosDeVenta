package graficas;
 
import javax.swing.JFrame;
 
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.util.Rotation;
 
public class PieChart extends JFrame {
 
 private static final long serialVersionUID = 1L;
 
 public PieChart(String applicationTitle, String chartTitle) {
  super(applicationTitle);
  // Creamos el conjunto de datos con las votaciones
  PieDataset dataset = createDataset();
 
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
 
 private PieDataset createDataset() {
  DefaultPieDataset result = new DefaultPieDataset();
 
  result.setValue("PP", 186);
  result.setValue("PSOE", 110);
  result.setValue("CIU", 16);
  result.setValue("IU-LV", 11);
  result.setValue("AMAIUR", 7);
  result.setValue("UPyD", 5);
  result.setValue("EAJ-PNV", 5);
  result.setValue("ERC", 3);
  result.setValue("BNG", 2);
  return result;
 
 }
 
 /**
  * Creates a chart
  */
 
 private JFreeChart createChart(PieDataset dataset, String title) {
 
  JFreeChart chart = ChartFactory.createPieChart3D(title, // chart title
    dataset, // data
    true, // include legend
    true, false);
 
  PiePlot3D plot = (PiePlot3D) chart.getPlot();
  plot.setStartAngle(290);
  plot.setDirection(Rotation.CLOCKWISE);
  plot.setForegroundAlpha(0.5f);
  return chart;
 
 }
 
 public static void main(String[] args) {
  PieChart demo = new PieChart("Elecciones Generales 2011",
    "Escaños obtenidos por partido");
  demo.pack();
  demo.setVisible(true);
 }
}