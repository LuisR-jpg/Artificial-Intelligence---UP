import java.io.*;
import java.io.IOException;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import javax.swing.*;
import javax.swing.tree.*;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.imageio.ImageIO;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.edit.PDPageContentStream;
import org.apache.pdfbox.pdmodel.graphics.xobject.PDJpeg;
import org.apache.pdfbox.pdmodel.graphics.xobject.PDXObjectImage;
public class PDFArbolSubcarpetas{
	static JTree tree = new JTree(new DefaultMutableTreeNode());
	static JFrame jaja = new JFrame("Robles Jimenez");
	static JPanel jeje;
	static String imagen = "ArbolSubcarpetas.jpg";
	static int i = 0, h, size = 790;
	public static void main(String[] args){
		File file = fileChooser();
		generarArbol(file);
		extenderArbol();
		imprimirArbol();
		guardarImagen(jeje);
		generarDocumento();
		limpiar();
		System.exit(0);
	}
	private static File fileChooser(){
		JFileChooser ch = new JFileChooser();
		ch.setDialogTitle("Select a File...");
		ch.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		ch.setAcceptAllFileFilterUsed(true);
		if (ch.showOpenDialog(null) == JFileChooser.APPROVE_OPTION){
			File f = ch.getSelectedFile();
			System.out.println("\tLa carpeta recibida es: " + f);
			return f;
		}	
		return null;
	}
	private static void generarArbol(File f){
		DefaultMutableTreeNode root = new DefaultMutableTreeNode(nombre(f));
		tree.setModel(new DefaultTreeModel(root));
		rama(f, root);	
	}
	private static void rama(File f, DefaultMutableTreeNode nodo){
		File[] fi = f.listFiles(
			new FileFilter(){
				@Override
				public boolean accept(File f){
					return f.isDirectory();
				}
			}
		);
		for( File i: fi ){
			DefaultMutableTreeNode no = new DefaultMutableTreeNode(nombre(i));
			nodo.add(no);
			rama(i, no);
		}
		return;
	}
	private static String nombre(File n){
		String aux = n.toString(), str = "";
		for( int i = 0; i < aux.length() && aux.charAt(aux.length()-i-1) != '\\'; i++ )
			str = aux.charAt(aux.length()-1-i) + str;
		return str;
	}
	private static void extenderArbol(){
		for( int i = 0; i < tree.getRowCount(); i++ )
			tree.expandRow(i);
	}
	private static void imprimirArbol(){
		DefaultTreeCellRenderer render = new DefaultTreeCellRenderer();
		render.setLeafIcon(new DefaultTreeCellRenderer().getOpenIcon());
		tree.setCellRenderer(render);
		jaja.getContentPane().setBackground(Color.white);
		jeje = new JPanel(new FlowLayout(FlowLayout.LEFT));
		jeje.setBackground(Color.white);
		jeje.add(tree);
		jaja.add(new JScrollPane(jeje));
		jaja.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		jaja.pack();
		jaja.setSize(500, 750);
		//jaja.setVisible(true);
	}

	private static void guardarImagen(JPanel panel){
		try {
			BufferedImage original = new BufferedImage(panel.getWidth(), panel.getHeight(), BufferedImage.TYPE_INT_RGB); 
			panel.paint(original.getGraphics());
			ImageIO.write(original, "jpg", new File(imagen));
			int x = original.getHeight()/size + 1;
			for( i = 0; i < x; i++ ){
				//System.out.print("\t\t" + i + ". ");
				h = i+1 == x? original.getHeight() - (i > 0? i: 0)*size: size;
				//System.out.println(h);
				BufferedImage sub = original.getSubimage(0, size*i, original.getWidth(), h);
				ImageIO.write(sub, "jpg", new File(i + imagen)); 
			}
		} catch (Exception e) {
			System.out.println("\t" + e.getMessage());
		}
	}
	private static void generarDocumento(){	
		String nombre = "ArbolSubcarpetas.pdf";
		try{	
			PDDocument doc = new PDDocument();
			PDPage[] pages = new PDPage[i];
			for( int j = 0; j < i; j++ ){
				pages[j] = new PDPage();
				doc.addPage(pages[j]);
				PDXObjectImage image = new PDJpeg(doc, new FileInputStream(j + imagen));
				PDPageContentStream content = new PDPageContentStream(doc, pages[j]);
				int he = j+1 == i? size - h: 0;
				//System.out.println(he);
				content.drawImage(image, 7, he);
				content.close();
			}
			doc.save(nombre);
			doc.close();
			System.out.print("\tEl PDF ha sido guardado en: " + System.getProperty("user.dir"));
		}
		catch( Exception e ){	
			System.out.println("\tAlgo no salió bien");
		}
	}
	private static void limpiar(){
		File archivo = new File(imagen);
		archivo.delete();
		for( int j = 0; j < i; j++ ){
			archivo = new File(j + imagen);
			archivo.delete();	
		}
	}
}