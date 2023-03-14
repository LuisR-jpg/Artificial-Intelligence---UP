package codigo;

import java.awt.EventQueue;
import java.util.logging.*;
import javax.swing.JFrame;
import javax.swing.JTextField;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JTextArea;
import java.awt.event.ActionListener;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.awt.event.ActionEvent;
import java.awt.SystemColor;
import javax.swing.border.BevelBorder;
import javax.swing.border.LineBorder;
import java.awt.Color;
import javax.swing.border.TitledBorder;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;
import javax.swing.border.EtchedBorder;
import javax.swing.JScrollPane;

public class FrmPrincipal {

	private JFrame frame;
	private JTextField txt_input;
	private static JTextArea txt_result;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FrmPrincipal window = new FrmPrincipal();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public FrmPrincipal() {
		initialize();
	}
	
	public static String readFileAsString(String fileName)throws Exception {
		String data = "";
	    data = new String(Files.readAllBytes(Paths.get(fileName)));
	    return data;
	}
	
	public static void analizeText(String fileName) {
		try {
            Reader lector = new BufferedReader(new FileReader(fileName));
            Lexer lexer = new Lexer(lector);
            String resultado = "";
            while (true) {
                Tokens tokens = lexer.yylex();
                if (tokens == null) {
                    resultado += "FIN";
                    txt_result.setText(resultado);
                    return;
                }
                switch (tokens) {
                    case ERROR:
                        resultado += "Simbolo no definido\n";
                        break;
                    case Identificador: case Numero: case Reservadas:
                        resultado += lexer.lexeme + ": Es un " + tokens + "\n";
                        break;
                    default:
                        resultado += "Token: " + tokens + "\n";
                        break;
                }
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.getContentPane().setBackground(SystemColor.window);
		frame.setBounds(100, 100, 450, 1060);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		txt_input = new JTextField();
		txt_input.setFont(new Font("Tahoma", Font.PLAIN, 24));
		txt_input.setBounds(10, 11, 414, 42);
		frame.getContentPane().add(txt_input);
		txt_input.setColumns(10);
		
		JButton btn_analyze = new JButton("Analyze");
		btn_analyze.setBorder(new LineBorder(new Color(0, 0, 0), 1, true));
		btn_analyze.setBackground(SystemColor.window);
		btn_analyze.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				File archivo = new File("archivo.txt");
		        PrintWriter escribir;
		        try {
		            escribir = new PrintWriter(archivo);
		            escribir.print(txt_input.getText());
		            escribir.close();
		        } catch (FileNotFoundException ex) {
		            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
		        }
		        
		        analizeText("archivo.txt");
			}
		});
		btn_analyze.setFocusPainted(false);
		btn_analyze.setFont(new Font("Tahoma", Font.PLAIN, 24));
		btn_analyze.setBounds(225, 63, 199, 42);
		frame.getContentPane().add(btn_analyze);
		
		txt_result = new JTextArea();
		txt_result.setEditable(false);
		txt_result.setBorder(new LineBorder(new Color(0, 0, 0)));
		txt_result.setBounds(10, 116, 414, 894);
		frame.getContentPane().add(txt_result);
				
		JButton btn_select_file = new JButton("Choose file");
		btn_select_file.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFileChooser file_chooser = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
				file_chooser.setAcceptAllFileFilterUsed(false);
				file_chooser.setDialogTitle("Select a .txt file");
				FileNameExtensionFilter restrict = new FileNameExtensionFilter("Only .txt files", "txt");
	            file_chooser.addChoosableFileFilter(restrict);
	            int r = file_chooser.showSaveDialog(null);
	            
	            if (r == JFileChooser.APPROVE_OPTION){
	            	txt_result.setText("Code obtained from: " + file_chooser.getSelectedFile().getAbsolutePath());
	            	try{
	            		analizeText(file_chooser.getSelectedFile().getAbsolutePath());
	            	}
	            	catch(Exception ex) {
	            		
	            	}
	            }
	            else txt_result.setText("the user cancelled the operation");
	            
			}
		});
		btn_select_file.setBorder(new LineBorder(new Color(0, 0, 0), 1, true));
		btn_select_file.setBackground(SystemColor.window);
		btn_select_file.setFont(new Font("Tahoma", Font.PLAIN, 24));
		btn_select_file.setFocusPainted(false);
		btn_select_file.setBounds(10, 63, 199, 42);
		frame.getContentPane().add(btn_select_file);
		
		
	}
}
