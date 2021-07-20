import java.sql.Connection;
import java.sql.DriverManager;

public class SelectQuery {

    private Connection conn;

    /*
     * 创建一个返回Connection的方法
     */
    public Connection getConnection(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("数据库驱动加载成功");
            String connectionUrl = "jdbc:sqlserver://127.0.0.1:1433;databaseName=zyxt;user=sa;password=123456";
            conn=DriverManager.getConnection(connectionUrl);
            if(conn==null){
                System.out.println("数据库连接失败");
            }else {
                System.out.println("数据库连接成功");
            }
            System.out.println("-----------------------");
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return conn;
    }
}

