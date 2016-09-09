
import com.mapdirectory.ReadJSONBean;
import com.mapdirectory.ReadJSONSessionBeanURL;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.parser.ParseException;

/**
 *
 * @author dmuthami
 */
@WebServlet(name = "ReadJSON", urlPatterns = {"/ReadJSON"})
public class ReadJSON extends HttpServlet {

    @EJB
    ReadJSONSessionBeanURL urlBean;

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PrintWriter out = res.getWriter();
        //readJSONFile(out);
        readJSONURL(out);

    }

    public void readJSONFile(PrintWriter out) throws IOException {
        ReadJSONBean myJSON = new ReadJSONBean();
        String output = null;
        StringBuilder sb = null;
        try {
            output = myJSON.getArraySize();
            //sb = myJSON.printArray("objects");
            sb = myJSON.printArrayElements("objects");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(ReadJSON.class.getName()).log(Level.SEVERE, null, ex);
            output = ex.getMessage();
        } catch (ParseException ex) {
            Logger.getLogger(ReadJSON.class.getName()).log(Level.SEVERE, null, ex);
            output = ex.getMessage();
        }
        out.println(output);
        out.println(sb);
    }

    public void readJSONURL(PrintWriter out) {

        StringBuilder sb = null;
        try {
            sb = urlBean.printArrayElementsURL("objects", "http://192.168.43.101/api/layers/");
        } catch (IOException ex) {
            Logger.getLogger(ReadJSON.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ReadJSON.class.getName()).log(Level.SEVERE, null, ex);
        }

        out.println(sb);
    }
}
