/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proiect;
import java.sql.*;
/**
 *
 * @author Casi
 */
public class ProiectBilet9 {
    static Connection conexiune;
    static Statement statement;
    static ResultSet rezultat;
    
    public ProiectBilet9() throws SQLException {
    conexiune=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","casi","");
    statement=(Statement)conexiune.createStatement();
}
    public static void Instructiune(String instructiune) throws SQLException{
        rezultat=statement.executeQuery(instructiune);
    }
    
    public static StringBuilder rezultat3a(String col3a) throws SQLException{
        StringBuilder rez3a=null;
        rez3a=new StringBuilder().append("3.a)Sa se gaseasca numele si descrierea retetelor nonvegetariene cu timp de preparare între o ora si 2 ore.\n\n\tNUME \t\t DESCRIERE \n\n");
        while(rezultat.next()){
            if(rez3a==null){
                rez3a=new StringBuilder().append("\t").append(rezultat.getString("nume")).append("\t").append(rezultat.getString("descriere")).append("\n");
            }
            else{
               rez3a=new StringBuilder().append(rez3a).append("\t").append(rezultat.getString("nume")).append("\t").append(rezultat.getString("descriere")).append("\n");
            }
        }
        return rez3a;
}
        public static StringBuilder rezultat3b(String col3b) throws SQLException{
        StringBuilder rez3b=null;
        rez3b=new StringBuilder().append("3.b)Sa se gaseasca detaliile din Set_ingrediente unde nu exista comentarii.\n\n\t\tRETETA_ID \t INGRED_ID \t CANTITATE \t UM \t COMENTARII \n\n");
        while(rezultat.next()){
            if(rez3b==null){
                rez3b=new StringBuilder().append("\t\t").append(rezultat.getString("reteta_id")).append("\t").append(rezultat.getString("ingred_id")).append("\t").append(rezultat.getString("cantitate")).append("\t").append(rezultat.getString("um")).append("\t").append(rezultat.getString("comentarii")).append("\n");
            }
            else{
               rez3b=new StringBuilder().append(rez3b).append("\t\t").append(rezultat.getString("reteta_id")).append("\t").append(rezultat.getString("ingred_id")).append("\t").append(rezultat.getString("cantitate")).append("\t").append(rezultat.getString("um")).append("\t").append(rezultat.getString("comentarii")).append("\n");
            }
        }
        return rez3b;
}
        public static StringBuilder rezultat4a(String col4a) throws SQLException{
        StringBuilder rez4a=null;
        rez4a=new StringBuilder().append("4.a)Sa se gaseasca sub forma (reteta_id1,reteta_id2) perechi unice de retete ce utilizeaza ingredientul cu id_ingredient=1.\n\n\t\t\tRETETE \n\n");
        while(rezultat.next()){
            if(rez4a==null){
                rez4a=new StringBuilder().append("\t\t\t").append("(").append(rezultat.getString("reteta_id1")).append(", ").append(rezultat.getString("reteta_id2")).append(")").append("\n");
            }
            else{
               rez4a=new StringBuilder().append(rez4a).append("\t\t\t").append("(").append(rezultat.getString("reteta_id1")).append(", ").append(rezultat.getString("reteta_id2")).append(")").append("\n");
            }
        }
        return rez4a;
}
        public static StringBuilder rezultat4b(String col4b) throws SQLException{
        StringBuilder rez4b=null;
        rez4b=new StringBuilder().append("4.b) Sa se gaseasca numele si descrierea retetelor ce contin ciuperci.\n\n\tNUME \t\t DESCRIERE \n\n");
        while(rezultat.next()){
            if(rez4b==null){
                rez4b=new StringBuilder().append("\t").append(rezultat.getString("nume")).append("\t").append(rezultat.getString("descriere")).append("\n");
            }
            else{
               rez4b=new StringBuilder().append(rez4b).append("\t").append(rezultat.getString("nume")).append("\t").append(rezultat.getString("descriere")).append("\n");
            }
        }
        return rez4b;
}
        public static StringBuilder rezultat5a(String col5a) throws SQLException{
        StringBuilder rez5a=null;
        rez5a=new StringBuilder().append("5.a)Sa se gaseasca numele, descrierea si timpul de preparare pentru retetele nonvegetariene, care au timp de preparare mai mic \ndecât vreuna din retele vegetariene.\n\nNUME \t\t DESCRIERE \t\t\t\t\t TIMP_PREPARARE \n\n");
        while(rezultat.next()){
            if(rez5a==null){
                rez5a=new StringBuilder().append(rezultat.getString("nume")).append("\t\t").append(rezultat.getString("descriere")).append("         ").append(rezultat.getString("timp_preparare")).append("\n");
            }
            else{
               rez5a=new StringBuilder().append(rez5a).append(rezultat.getString("nume")).append("\t\t").append(rezultat.getString("descriere")).append("         ").append(rezultat.getString("timp_preparare")).append("\n");
            }
        }
        return rez5a;
}
        public static StringBuilder rezultat5b(String col5b) throws SQLException{
        StringBuilder rez5b=null;
        rez5b=new StringBuilder().append("5.b)Sa se gaseasca denumirea ingredientului folosit în cea cantitatea cea mai mare.\n\n\t\t\tINGREDIENT \n\n");
        while(rezultat.next()){
            if(rez5b==null){
                rez5b=new StringBuilder().append("\t\t\t").append(rezultat.getString("ingredient")).append("\n");
            }
            else{
               rez5b=new StringBuilder().append(rez5b).append("\t\t\t").append(rezultat.getString("ingredient")).append("\n");
            }
        }
        return rez5b;
        }
        public static StringBuilder rezultat6a(String col6a) throws SQLException{
        StringBuilder rez6a=null;
        rez6a=new StringBuilder().append("6.a)Sa se gaseasca timpul de preparare minim si maxim pentru fiecare tip de reteta.\n\n\t\tTIMP PREPARARE MINIM \t TIMP PREPARARE MAXIM \n\n");
        while(rezultat.next()){
            if(rez6a==null){
                rez6a=new StringBuilder().append("\t\t").append(rezultat.getString("timp_preparare1")).append("\t\t").append(rezultat.getString("timp_preparare2")).append("\n");
            }
            else{
               rez6a=new StringBuilder().append(rez6a).append("\t\t").append(rezultat.getString("timp_preparare1")).append("\t\t").append(rezultat.getString("timp_preparare2")).append("\n");
            }
        }
        return rez6a;
}
        public static StringBuilder rezultat6b(String col6b) throws SQLException{
        StringBuilder rez6b=null;
        rez6b=new StringBuilder().append("6.b)Sa se gaseasca cantitatea medie folosita pentru ingredientul 'usturoi'.\n\n\t\t\tCANTITATE MEDIE USTUROI \n\n");
        while(rezultat.next()){
            if(rez6b==null){
                rez6b=new StringBuilder().append("\t\t\t").append(rezultat.getString("avg")).append("\n");
            }
            else{
               rez6b=new StringBuilder().append(rez6b).append("\t\t\t").append(rezultat.getString("avg")).append("\n");
            }
        }
        return rez6b;
        }
            
    public static void main(String[] args)throws SQLException{
        new ProiectBilet9();
        Instructiune("select AVG(cantitate) as avg from set_ingrediente where ingred_id=(select ingred_id from ingredient  where ingredient='usturoi')");
        StringBuilder rez6b=rezultat6b("cantitate");
        System.out.print(rez6b.toString());
    }
}
