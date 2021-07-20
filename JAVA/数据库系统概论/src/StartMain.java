import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

public class StartMain {

    private static Connection conn;

    public static void main(String[] args) {
        conn=new SelectQuery().getConnection();
        System.out.println("----------------采油厂油水井作业成本管理系统----------------");
        int sel = 8;
        Scanner sc=new Scanner(System.in);

        do {
            print_menu();
            sel = sc.nextInt();
            switch (sel) {
                case 1: GetInsert();break;
                case 2: GetUpdate();break;
                case 3: GetDelete();break;
                case 4: GetSelect();break;
                case 5: SolveProblem();break;
            }
        } while (sel != 0);
    }


    public static void print_menu() {
        System.out.println("请键入不同数字选择功能:");
        System.out.println("1.增加\t 2.修改\t3.删除\t4.查询\t0.退出");
        System.out.println("5.实验三中实验内容2的查询功能的逐条实现");
        System.out.print("请输入你的选择: ");
    }

    /*
     * INSERT
     */
    public static void GetInsert(){
        if(conn!=null){
            //INSERT
            System.out.println("-----------INSERT------------");
            Scanner scanner = new Scanner(System.in);
            String dbname, data;
            System.out.print("请输入待插入数据的表:");
            dbname =  scanner.next();
            System.out.println("请输入待插入数据:");
            data =  scanner.next();
            String insert_str="INSERT INTO " + dbname + " VALUES (" + data + ")";
            try {
                Statement insertstatement = conn.createStatement();
                int result = insertstatement.executeUpdate(insert_str);
                if (result > 0) {
                    System.out.println("添加成功");
                    System.out.println("-----------------------");
                } else {
                    System.out.println("添加失败");
                    System.out.println("-----------------------");
                }
            } catch (Exception e) {
                System.out.println("添加失败");
                System.out.println("-----------------------");
            }
        }
        else{
            System.out.println("请检查数据库连接");
            System.out.println("-----------------------");
        }

    }

    private static void db_select(String select_str) {
        try {
            PreparedStatement selectps=conn.prepareStatement(select_str);
            ResultSet rs=selectps.executeQuery();
            for(int i=1;i<=rs.getMetaData().getColumnCount();i++){
                System.out.print(rs.getMetaData().getColumnName(i)+"\t");
            }
            System.out.println();
            while (rs.next()) {
                ArrayList<String> str = new ArrayList<String>();
                String temp = "非空";
                for (int i = 1;i <= rs.getMetaData().getColumnCount(); i++) {
                    temp = rs.getString(i);
                    if (temp == null) {
                        break;
                    } else {
                        str.add(temp);
                    }
                }
                for (int i = 0; i < str.size(); i++) {
                    System.out.print(str.get(i) + "\t");
                }
                System.out.println();
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    /*
     * SELECT
     */
    public static void GetSelect(){
        if(conn!=null){

            //SELECT
            System.out.println("-----------SELECT------------");
            Scanner scanner =  new Scanner(System.in);
            System.out.print("请输入待查询的表名:");
            String table_name = scanner.next();
            String select_str=" SELECT * FROM " + table_name;
            try {
                PreparedStatement selectps=conn.prepareStatement(select_str);
                ResultSet rs=selectps.executeQuery();
                for(int i=1;i<=rs.getMetaData().getColumnCount();i++){
                    System.out.print(rs.getMetaData().getColumnName(i)+"\t");
                }
                System.out.println();
                while (rs.next()) {
                    ArrayList<String> str = new ArrayList<String>();
                    String temp = "非空";
                    for (int i = 1;i <= rs.getMetaData().getColumnCount(); i++) {
                        temp = rs.getString(i);
                        if (temp == null) {
                            break;
                        } else {
                            str.add(temp);
                        }
                    }
                    for (int i = 0; i < str.size(); i++) {
                        System.out.print(str.get(i) + "\t");
                    }
                    System.out.println();
                }
                System.out.println("------------------\n查询成功");
                System.out.println("-----------------------");
            } catch (Exception e) {
                // TODO: handle exception
                System.out.println("查询失败");
                System.out.println("-----------------------");
            }
        }
        else {
            System.out.println("请检查数据库连接");
            System.out.println("-----------------------");
        }
    }

    /*
     * UPDATE
     */
    public static void GetUpdate(){
        if(conn!=null){
            //UPDATE
            System.out.println("-----------UPDATE------------");
            String table_name, column_name, update_data, column, restricted_data;
            Scanner scanner =  new Scanner(System.in);
            System.out.print("请输入待修改的表名:");
            table_name = scanner.next();
            System.out.print("请输入待修改的列名:");
            column_name = scanner.next();
            System.out.print("请输入需更改的数据:");
            update_data = scanner.next();
            System.out.print("请输入定位的列:");
            column = scanner.next();
            System.out.print("请输入定位列的值:");
            restricted_data = scanner.next();
            String update_str="UPDATE " + table_name +  " SET " + column_name + " = " + update_data + " WHERE " + column + " = " + restricted_data;
            try {
                Statement updatestatement=conn.createStatement();
                int result=updatestatement.executeUpdate(update_str);
                if(result>0){
                    System.out.println("------------------------\n修改成功！");
                    System.out.println("-----------------------");
                }else {
                    System.out.println("修改失败");
                    System.out.println("-----------------------");
                }
            } catch (Exception e) {
                // TODO: handle exception
                System.out.println("修改失败");
                System.out.println("-----------------------");
            }
        }
        else {
            System.out.println("请检查数据库连接");
            System.out.println("-----------------------");
        }
    }

    /*
     * DELETE
     */
    public static void GetDelete(){
        if(conn!=null){
            //DELETE
            System.out.println("-----------DELETE------------");
            String table_name, column, data;
            Scanner scanner =  new Scanner(System.in);
            System.out.print("请输入待删除数据的表名:");
            table_name = scanner.next();
            System.out.print("请输入列名:");
            column = scanner.next();
            System.out.print("请输入列中数据:");
            data = scanner.next();
            String delete_str="DELETE  FROM " + table_name + " WHERE " + column + " = " + data;
            try {
                Statement deletestatement=conn.createStatement();
                int result=deletestatement.executeUpdate(delete_str);
                if(result>0){
                    System.out.println("删除成功！");
                    System.out.println("-----------------------");
                }else {
                    System.out.println("删除失败");
                    System.out.println("-----------------------");
                }
            } catch (Exception e) {
                // TODO: handle exception
                System.out.println("删除失败");
                System.out.println("-----------------------");
            }
        }
        else {
            System.out.println("请检查数据库连接");
            System.out.println("-----------------------");
        }
    }

    /*
    实验三实验内容2
     */
    private static void SolveProblem() {

        if(conn!=null){
            System.out.println("----------------------------------------------");
            System.out.println("⑴ 采油一矿二队2018-5-1到2018-5-28有哪些项目完成了预算，列出相应明细。");
            db_select("SELECT\n" +
                    "    [单据号],[预算单位],[井号],[预算金额],[预算人],[预算日期] \n" +
                    "FROM\n" +
                    "    [作业项目表] \n" +
                    "WHERE\n" +
                    "    [预算日期] BETWEEN '2018-5-1' AND '2018-5-28' \n" +
                    "    AND [预算单位]= '112201002';\n");
            System.out.println("----------------------------------------------");
            System.out.println("⑵ 采油一矿二队2018-5-1到2018-5-28有哪些项目完成了结算，列出相应明细。");
            db_select("SELECT\n" +
                    "    [单据号],[井号],[结算金额],[结算人],[结算日期]\n" +
                    "FROM\n" +
                    "    [作业项目表]\n" +
                    "WHERE\n" +
                    "    [结算日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "    AND [预算单位] = '112201002';\n");
            System.out.println("----------------------------------------------");
            System.out.println("⑶ 采油一矿二队2018-5-1到2018-5-28有哪些项目完成了结算，列出相应的材料费消耗明细。");
            db_select("SELECT *\n" +
                    "FROM \n" +
                    "    [材料消耗明细表]\n" +
                    "WHERE\n" +
                    "    [单据号] \n" +
                    "    IN\n" +
                    "    (SELECT [单据号]\n" +
                    "    FROM\n" +
                    "        [作业项目表]\n" +
                    "    WHERE \n" +
                    "        [结算日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "        AND [预算单位] = '112201002');\n");
            System.out.println("----------------------------------------------");
            System.out.println("⑷ 采油一矿二队2018-5-1到2018-5-28有哪些项目完成了入账，列出相应明细。");
            db_select("SELECT\n" +
                    "    [单据号],[井号],[入账金额],[入账人],[入账日期]\n" +
                    "FROM\n" +
                    "    [作业项目表]\n" +
                    "WHERE\n" +
                    "    [入账日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "    AND [预算单位] = '112201002';\n");
            System.out.println("----------------------------------------------");
            System.out.println("⑸ 列出采油一矿二队2018-5-1到2018-5-28总的预算金额。");
            db_select("SELECT\n" +
                    "    SUM([预算金额]) AS 一矿二队总预算金额\n" +
                    "FROM\n" +
                    "    [作业项目表]\n" +
                    "    WHERE\n" +
                    "    [预算日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "    AND [预算单位] = '112201002';\n");
            System.out.println("----------------------------------------------");
            System.out.println("⑹ 列出采油一矿二队2018-5-1到2018-5-28总的结算金额。");
            db_select("SELECT\n" +
                    "\tSUM([结算金额]) AS 一矿二队总结算金额\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[结算日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "\tAND [预算单位] = '112201002';");
            System.out.println("----------------------------------------------");
            System.out.println("⑺ 列出采油一矿二队2018-5-1到2018-5-28总的入账金额。");
            db_select("SELECT\n" +
                    "\tSUM([入账金额]) AS 一矿二队总入账金额\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[入账日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "\tAND [预算单位] = '112201002';");
            System.out.println("----------------------------------------------");
            System.out.println("⑻ 列出采油一矿2018-5-1到2018-5-28总的入账金额。");
            db_select("SELECT\n" +
                    "\tSUM([入账金额]) AS 采油一矿总入账金额\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[入账日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "\tAND [预算单位] LIKE '112201___';");
            System.out.println("----------------------------------------------");
            System.out.println("⑼ 有哪些人员参与了入账操作。");
            db_select("SELECT DISTINCT\n" +
                    "\t[入账人]\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[入账人] <> '';");
            System.out.println("----------------------------------------------");
            System.out.println("⑽ 列出2018-5-1到2018-5-28进行了结算但未入账的项目。");
            db_select("SELECT\n" +
                    "\t[单据号]\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[结算日期] BETWEEN '2018-5-1' AND '2018-5-28'\n" +
                    "\tAND\n" +
                    "\t[入账日期] NOT BETWEEN '2018-5-1' AND '2018-5-28';");
            System.out.println("----------------------------------------------");
            System.out.println("⑾ 列出采油一矿二队的所有项目，按入账金额从高到低排列。");
            db_select("SELECT\n" +
                    "\t[单据号],[入账金额]\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[预算单位] = '112201002'\n" +
                    "\tORDER BY\n" +
                    "\t[入账金额] DESC;");
            System.out.println("----------------------------------------------");
            System.out.println("⑿ 列出有哪些施工单位实施了项目，并计算各单位所有项目结算金额总和。");
            db_select("SELECT \n" +
                    "\t[施工单位], SUM([结算金额]) AS 结算金额总和\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tGROUP BY\n" +
                    "\t[施工单位];");
            System.out.println("----------------------------------------------");
            System.out.println("⒀ 找出消耗了材料三且消耗超过了2000元的项目，列出相应消耗明细(利用子查询)。");
            db_select("SELECT *\n" +
                    "FROM\n" +
                    "\t[材料消耗明细表]\n" +
                    "\tWHERE \n" +
                    "\t\t[单据号]\n" +
                    "\tIN\n" +
                    "\t(SELECT\n" +
                    "\t\t[单据号]\n" +
                    "\tFROM\n" +
                    "\t\t[材料消耗明细表]\n" +
                    "\t\tWHERE\n" +
                    "\t\t\t[物码] = 'wm003' AND [消耗数量]*[单价] > 2000);");
            System.out.println("----------------------------------------------");
            System.out.println("⒁ 作业公司二队参与了哪些项目。");
            db_select("SELECT \n" +
                    "\t[单据号]\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[施工单位] = '作业公司作业二队';");
            System.out.println("----------------------------------------------");
            System.out.println("⒂ 作业公司一队和二队参与了哪些项目（利用union）。");
            db_select("SELECT \n" +
                    "\t[单据号]\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[施工单位] = '作业公司作业一队'\n" +
                    "UNION\n" +
                    "SELECT \n" +
                    "\t[单据号]\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE\n" +
                    "\t[施工单位] = '作业公司作业二队';");
            System.out.println("----------------------------------------------");
            System.out.println("⒃ 采油一矿的油井是哪些作业队参与施工的。");
            db_select("SELECT\n" +
                    "\t[施工单位]\n" +
                    "FROM\n" +
                    "\t[作业项目表]\n" +
                    "\tWHERE [井号]\n" +
                    "\tIN\n" +
                    "\t(SELECT [井号]\n" +
                    "\tFROM\n" +
                    "\t\t[油水井表]\n" +
                    "\tWHERE\n" +
                    "\t\t[井别] = '油井'\n" +
                    "\t\tAND\n" +
                    "\t\t[单位代码] IN\n" +
                    "\t\t(SELECT\n" +
                    "\t\t [单位代码]\n" +
                    "\t\tFROM\n" +
                    "\t\t\t[单位代码表]\n" +
                    "\t\tWHERE \n" +
                    "\t\t\t[单位名称]\n" +
                    "\t\tLIKE '采油一矿%'));");
            System.out.println("----------------------------------------------");
        }
        else {
            System.out.println("请检查数据库连接");
            System.out.println("-----------------------");
        }
    }
}

