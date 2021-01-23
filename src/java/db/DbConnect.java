package db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class DbConnect {
    private final Connection c;
    private final Statement st;
    private PreparedStatement checkLogin,checkEmail,insertUser,insertLogin,getUserDetails,seeProfile,postUpload,getPost,getMessages,checkId,
            update,getAllDetails,getPublicDetails,getPostId,getFeed,getFeed1,getFollower,insertFollower,checkFollower,removeFollower,removeLike,insertLike,removeComments,insertComments,getFollowing,
            getFollowerDetails,getFollowingDetails,getFriends,getFriend1,get_m_pid,getMessage2,getMessage,getMessage1,uploadMessage,getFriend,updateFriendTable,updatePassword,
            friendMessageUpdate,lastId,lastCommentId,UpdateLastMessage,getLastMessage,checLastkMessage,insertLastMessage,countLikes,getName,countShare,countComment,checkLike;
    public DbConnect() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/blood_ghar","root","19142612");
        st=c.createStatement();

        insertLastMessage=c.prepareStatement("insert into last_message (id,f_id,m_id) values(?,?,?)");
        checLastkMessage=c.prepareStatement("select m_id from  last_message where (id=? and f_id=?) or (id=? and f_id=?)");
        UpdateLastMessage=c.prepareStatement("update last_message set m_id=?  where (id=? and f_id=?) or (id=? and f_id=?)");
        lastId=c.prepareStatement("select last_insert_id() as m_id from message where id=? and p_id=? and text=? limit 1");
        lastCommentId=c.prepareStatement("select last_insert_id() as c_id from comments where p_id=? and id=? and text=? limit 1");
        updatePassword =c.prepareStatement("update login set password=? where email=?");
        uploadMessage=c.prepareStatement("insert into message (id,p_id,text,date) values(?,?,?,now())");
        getMessage2=c.prepareStatement("select *  from  message where m_id=?");
        getMessage1=c.prepareStatement("select *  from  message where (m_id<? and id=? and p_id=?) or (m_id<? and p_id=? and id=?) order by m_id desc limit 10 ");
        getMessage=c.prepareStatement("select *  from  message where (id=? and p_id=?) or (p_id=? and id=?) order by m_id desc limit 10 ");
        getFollowingDetails=c.prepareStatement("select id from  follower where f_id=?");
        getFollowerDetails=c.prepareStatement("select f_id from  follower where id=?");
        getFollowing=c.prepareStatement("select count(id) from  follower where f_id=?");
        getFollower=c.prepareStatement("select count(f_id) from  follower where id=?");
        getFeed=c.prepareStatement("select * from post order by p_id desc limit 3");
        getFeed1=c.prepareStatement("select * from post where p_id<? order by p_id desc limit 3");
        getPostId=c.prepareStatement("select p_id from post where id=?");
        getPublicDetails=c.prepareStatement("select * from  user_details where id=?");
        getAllDetails=c.prepareStatement("select * from user_details where id=? ");
        update=c.prepareStatement("update user_details set name=?,number=?,dob=?,gender=?,blood=?,state=?,city=?,pin_code=? where id=? ");
        checkId=c.prepareStatement("select id from  user_details where id=?");
        getMessages=c.prepareStatement("select * from post where id=?");
        getPost=c.prepareStatement("select media from post where p_id=?");
        postUpload=c.prepareStatement("insert into post (id,text,media,date) value(?,?,?,now())");
        seeProfile=c.prepareStatement("select * from  login where email=?");
        getUserDetails=c.prepareStatement("select * from  user_details where email=?");
        checkEmail=c.prepareStatement("select email from  login where email=?");
        checkLogin =c.prepareStatement("select * from  login where email=? and password=?");
        insertUser=c.prepareStatement("insert into user_details (email,id,name) values(?,?,?)");
        insertLogin=c.prepareStatement("insert into login (email,password) values(?,?)");
        getLastMessage=c.prepareStatement("select m_id from  follower where id=? or f_id=?");
        getFriend=c.prepareStatement("select distinct(f_id) from  follower where id=?");
        getFriend1=c.prepareStatement("select distinct(id) from  follower where f_id=?");
        
        getName=c.prepareStatement("select name from  user_details where id=?");
        countLikes=c.prepareStatement("select count(id) from likes where p_id=?");
        countComment=c.prepareStatement("select count(id) from  comments where p_id=?");
        countShare=c.prepareStatement("select count(id) from share where p_id=?");
        checkLike=c.prepareStatement("select p_id from  likes where p_id=? and id=?");
        removeFollower=c.prepareStatement("delete  from  follower where id=? and f_id=?");
        checkFollower=c.prepareStatement("select id, f_id from  follower where id=? and f_id=?");
        insertFollower=c.prepareStatement("insert into follower (id,f_id,date) values(?,?,now())");
        removeLike=c.prepareStatement("delete  from  likes where p_id=? and id=?");
        insertLike=c.prepareStatement("insert into likes (p_id,id,date) values(?,?,now())");
        removeComments=c.prepareStatement("delete  from  comments where c_id=?");
        insertComments=c.prepareStatement("insert into comments (p_id,id,text,date) values(?,?,?,now())");
    }
    
    public java.util.ArrayList<java.util.HashMap> getFeed(int p_id) throws SQLException{
        getFeed1.setInt(1, p_id);
        ResultSet rs=getFeed1.executeQuery();
        java.util.ArrayList<java.util.HashMap> allFeed=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap message=new java.util.HashMap();
            message.put("date", rs.getString("date"));
            message.put("text", rs.getString("text"));
            message.put("p_id", rs.getInt("p_id"));
            message.put("id", rs.getString("id"));
            message.put("name", getName(rs.getString("id")));
            message.put("checkLike", checkLike(rs.getInt("p_id"),rs.getString("id")));
            message.put("totalLike", countLikes(rs.getInt("p_id")));
            message.put("totalComment", countComment(rs.getInt("p_id")));
            message.put("totalShare", countShare(rs.getInt("p_id")));
            
            allFeed.add(message);
        }
        return allFeed;
    }
    
    public java.util.ArrayList<java.util.HashMap> getFeed() throws SQLException{
        
        ResultSet rs=getFeed.executeQuery();
        java.util.ArrayList<java.util.HashMap> allFeed=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap message=new java.util.HashMap();
            message.put("date", rs.getString("date"));
            message.put("text", rs.getString("text"));
            message.put("p_id", rs.getInt("p_id"));
            message.put("id", rs.getString("id"));
            message.put("name", getName(rs.getString("id")));
            message.put("checkLike", checkLike(rs.getInt("p_id"),rs.getString("id")));
            message.put("totalLike", countLikes(rs.getInt("p_id")));
            message.put("totalComment", countComment(rs.getInt("p_id")));
            message.put("totalShare", countShare(rs.getInt("p_id")));
            allFeed.add(message);
        }
        return allFeed;
    }
    
    public String getName(String i) throws SQLException{
        getName.setString(1,i);
        ResultSet rs=getName.executeQuery();
        if(rs.next()){
            return rs.getString("name");
        }
        else{
            return null;
        }
        
    }
    
    public String checkLike(int p_id,String id) throws SQLException{
        checkLike.setInt(1,p_id);
        checkLike.setString(2,id);
        ResultSet rs=checkLike.executeQuery();
        if(rs.next()){
            return "yes";
        }
        else{
            return "no";
        }
    }
    
    public int countLikes(int p_id) throws SQLException{
        countLikes.setInt(1, p_id);
        
        ResultSet rs=countLikes.executeQuery();
        rs.next();
        return rs.getInt(1);
    }
    
    public int countComment(int p_id) throws SQLException{
        countComment.setInt(1,p_id);
        ResultSet rs=countComment.executeQuery();
        rs.next();
        return rs.getInt(1);
    }
    
    public int countShare(int p_id) throws SQLException{
        countShare.setInt(1,p_id);
        ResultSet rs=countShare.executeQuery();
        rs.next();
        return rs.getInt(1);
    }
    
    
    public java.util.ArrayList<java.util.HashMap> getFriend(String id) throws SQLException{
        
        getFriend.setString(1,id);
        ResultSet rs=getFriend.executeQuery();
        java.util.ArrayList<java.util.HashMap> getFriend=new java.util.ArrayList();
        
        while(rs.next()){
            java.util.HashMap details=new java.util.HashMap();
            details.put("f_id", rs.getString("f_id"));
            details.put("name", getName(rs.getString("f_id")));
            getFriend.add(details);
        }
        getFriend1.setString(1,id);
        ResultSet rs1=getFriend1.executeQuery();
        while(rs1.next()){
            java.util.HashMap details=new java.util.HashMap();
            details.put("f_id", rs1.getString("id"));
            details.put("name", getName(rs1.getString("id")));
            getFriend.add(details);
        }
        return getFriend;
    }
    
    
    
    
    public String updatePassword(String e,String p) throws SQLException{
            updatePassword.setString(1,p);
            updatePassword.setString(2,e);
            int x=updatePassword.executeUpdate();
            if(x!=0){
                return "Success";
            }else{
                return "Failed";
            }
        
    }
    
    
    
    
    
    public String uploadMessage(HashMap messageDetail) throws SQLException{
        try{
            uploadMessage.setString(1, (String)messageDetail.get("id"));
            uploadMessage.setString(2, (String)messageDetail.get("p_id"));
            uploadMessage.setString(3, (String)messageDetail.get("text"));
            lastId.setString(1, (String)messageDetail.get("id"));
            lastId.setString(2, (String)messageDetail.get("p_id"));
            lastId.setString(3, (String)messageDetail.get("text"));
            int x=uploadMessage.executeUpdate();
            ResultSet rs=lastId.executeQuery();
            String m_id="";
            while(rs.next()){
                m_id=rs.getString("m_id");
                checLastkMessage.setString(1, (String)messageDetail.get("id"));
                checLastkMessage.setString(2, (String)messageDetail.get("p_id"));
                checLastkMessage.setString(3, (String)messageDetail.get("p_id"));
                checLastkMessage.setString(4, (String)messageDetail.get("id"));
                ResultSet rs1=checLastkMessage.executeQuery();
                if(rs1.next()){
                    UpdateLastMessage.setInt(1, Integer.parseInt(m_id));
                    UpdateLastMessage.setString(2, (String)messageDetail.get("id"));
                    UpdateLastMessage.setString(3, (String)messageDetail.get("p_id"));
                    UpdateLastMessage.setString(4, (String)messageDetail.get("p_id"));
                    UpdateLastMessage.setString(5, (String)messageDetail.get("id"));
                    UpdateLastMessage.executeUpdate();
                }
                else{
                    insertLastMessage.setString(1, (String)messageDetail.get("id"));
                    insertLastMessage.setString(2, (String)messageDetail.get("p_id"));
                    insertLastMessage.setInt(3, Integer.parseInt(m_id));
                    insertLastMessage.executeUpdate();
                    
                }
                
                
            }
            if(x!=0)
              return  m_id;
            
            else
                 return "failed"; 
            
            }catch(Exception  ex){
          return "failed";  
        }
        
    }
    public java.util.HashMap getMessage(int m_id) throws SQLException{
        getMessage2.setInt(1, m_id);
        ResultSet rs=getMessage2.executeQuery();
        java.util.HashMap message=new java.util.HashMap();
        while(rs.next()){
            message.put("text", rs.getString("text"));
            message.put("date", rs.getString("date"));
            message.put("m_id", rs.getString("m_id"));
            message.put("id", rs.getString("id"));
            message.put("p_id", rs.getString("p_id"));
        }
        return message;
    }
    
    public java.util.ArrayList<java.util.HashMap> getMessage(String id, String p_id) throws SQLException{
        getMessage.setString(1, id);
        getMessage.setString(2, p_id);
        getMessage.setString(3, id);
        getMessage.setString(4, p_id);
        ResultSet rs=getMessage.executeQuery();
        java.util.ArrayList<java.util.HashMap> allMessageMe=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap message=new java.util.HashMap();
            message.put("text", rs.getString("text"));
            message.put("date", rs.getString("date"));
            message.put("m_id", rs.getString("m_id"));
            message.put("id", rs.getString("id"));
            allMessageMe.add(message);
        }
        return allMessageMe;
    }
    
    public java.util.ArrayList<java.util.HashMap> getMessage(int m_id, String id, String p_id) throws SQLException{
        getMessage1.setInt(1, m_id);
        getMessage1.setString(2, id);
        getMessage1.setString(3, p_id);
        getMessage1.setInt(4, m_id);
        getMessage1.setString(5, id);
        getMessage1.setString(6, p_id);
        ResultSet rs=getMessage1.executeQuery();
        java.util.ArrayList<java.util.HashMap> allMessageMe=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap message=new java.util.HashMap();
            message.put("text", rs.getString("text"));
            message.put("date", rs.getString("date"));
            message.put("m_id", rs.getString("m_id"));
            message.put("id", rs.getString("id"));
            allMessageMe.add(message);
        }
        return allMessageMe;
    }
    
    
    
//        public java.util.ArrayList<java.util.HashMap> getFriends(String id) throws SQLException{
//
//            get_m_pid.setString(1,id);
//            ResultSet rs=get_m_pid.executeQuery();
//            java.util.ArrayList<java.util.HashMap> getFollowingDetails=new java.util.ArrayList();
//            while(rs.next()){
//                java.util.HashMap details=new java.util.HashMap();
//                details.put("m_id", rs.getString("m_id"));
//                details.put("p_id", rs.getString("p_id"));
//                details.put("text", rs.getString("text"));
//                details.put("type", rs.getString("type"));
//                details.put("date", rs.getString("date"));
//                details.put("name", getName(rs.getString("p_id")));
//                getFollowingDetails.add(details);
//            }
//            return getFollowingDetails;
//        }

    
    
    public java.util.ArrayList<java.util.HashMap> getFollowingDetails(String f_id) throws SQLException{
        
        getFollowingDetails.setString(1,f_id);
        ResultSet rs=getFollowingDetails.executeQuery();
        java.util.ArrayList<java.util.HashMap> getFollowingDetails=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap details=new java.util.HashMap();
            details.put("f_id", rs.getString("id"));
            details.put("name", getName(rs.getString("id")));
            getFollowingDetails.add(details);
        }
        return getFollowingDetails;
    }
    
    
    public java.util.ArrayList<java.util.HashMap> getFollowerDetails(String id) throws SQLException{
        
        getFollowerDetails.setString(1,id);
        ResultSet rs=getFollowerDetails.executeQuery();
        java.util.ArrayList<java.util.HashMap> getFollowerDetails=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap details=new java.util.HashMap();
            details.put("f_id", rs.getString("f_id"));
            details.put("name", getName(rs.getString("f_id")));
            getFollowerDetails.add(details);
        }
        return getFollowerDetails;
    }
    
    
    public String checkFollower(String id, String f_id) throws SQLException{
            checkFollower.setString(1,f_id);
            checkFollower.setString(2,id);
            ResultSet rs=checkFollower.executeQuery();
            if(rs.next()){
                return "yes";
            }
            else{
                
                return "no";
            }
    }
    
    
    
    public HashMap getFollowers(String i) throws SQLException{
        HashMap userDetails=new HashMap();
        getFollower.setString(1,i);
        getFollowing.setString(1,i);
        ResultSet rs1=getFollower.executeQuery();
        ResultSet rs2=getFollowing.executeQuery();
        if(rs1.next() && rs2.next()){
            userDetails.put("fr", rs1.getInt(1));
            userDetails.put("fg", rs2.getInt(1));
            return userDetails;
        }
        else{
            return null;
        }
        
    }
    
    
    
    
    
    public String update(HashMap userdetails) {
        try{
        update.setString(1, (String)userdetails.get("name"));
        update.setString(2, (String)userdetails.get("number"));
        update.setDate(3, (java.sql.Date)userdetails.get("dob"));
        update.setString(4, (String)userdetails.get("gender"));
        update.setString(5, (String)userdetails.get("blood"));
        update.setString(6, (String)userdetails.get("state"));
        update.setString(7, (String)userdetails.get("city"));
        update.setString(8, (String)userdetails.get("pin_code"));
        update.setString(9, (String)userdetails.get("id"));
        int x=update.executeUpdate();
        if(x!=0)
                 return "Success";
        else
                 return "Failed";
        }catch(Exception ex){
               return ex+" ";
               } 
    }
    
     public String checkId(String id) throws SQLException{
        checkId.setString(1, id);
            ResultSet rs=checkId.executeQuery();
            if(rs.next())
                 return "Failed";
            else
                 return "Success"; 
       
        
    }
    
    public java.util.ArrayList<java.util.HashMap> getMessages(String id) throws SQLException{
        getMessages.setString(1, id);
        ResultSet rs=getMessages.executeQuery();
        java.util.ArrayList<java.util.HashMap> allMessage=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap message=new java.util.HashMap();
            message.put("date", rs.getString("date"));
            message.put("text", rs.getString("text"));
            message.put("p_id", rs.getInt("p_id"));
            allMessage.add(message);
        }
        return allMessage;
    }
    public java.util.ArrayList<java.util.HashMap> getPostId(String id) throws SQLException{
        getPostId.setString(1, id);
        ResultSet rs=getPostId.executeQuery();
        java.util.ArrayList<java.util.HashMap> allMessage=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap message=new java.util.HashMap();
            message.put("p_id", rs.getString("p_id"));
            allMessage.add(message);
        }
        return allMessage;
    }
    
    public byte[] getPost(int i){
        try{
            
            getPost.setInt(1, i);
            ResultSet rs=getPost.executeQuery();
            if(rs.next()){
                byte[] b=rs.getBytes("media");
                if(b.length!=0)
                    return b;
                else
                    return null;
            }
            else{
                return null;
            }
        }catch(Exception ex){
            return null;
            
        }
    }
    
    public String postUpload(HashMap userPost) throws SQLException{
        try{
            postUpload.setString(1, (String)userPost.get("id"));
            postUpload.setString(2, (String)userPost.get("text"));
            postUpload.setBinaryStream(3, (InputStream)userPost.get("media"));
            int x=postUpload.executeUpdate();
            if(x!=0)
                 return "Success";
            else
                 return "Failed"; 
        }catch(java.sql.SQLIntegrityConstraintViolationException  ex){
          return "Failed"+ex;  
        }
        
    }
    
    
    public String insertUserLogin(HashMap userDetails) throws SQLException{
        try{
            insertUser.setString(1, (String)userDetails.get("email"));
            insertUser.setString(2, (String)userDetails.get("id"));
            insertUser.setString(3, (String)userDetails.get("name"));
            insertLogin.setString(1, (String)userDetails.get("email"));
            insertLogin.setString(2, (String)userDetails.get("password"));
            
            int x=insertUser.executeUpdate();
            int y=insertLogin.executeUpdate();
            if(x!=0 && y!=0)
                 return "Success";
            else
                 return "Failed"; 
        }catch(java.sql.SQLIntegrityConstraintViolationException  ex){
          return "Already";  
        }
        
    }

    /**
     *
     * @param e
     * @param p
     * @return
     * @throws SQLException
     */
    public String checkLogin(String e,String p) throws SQLException{
        checkEmail.setString(1,e);
        ResultSet rs=checkEmail.executeQuery();
        if(rs.next()){
            checkLogin.setString(1,e);
            checkLogin.setString(2,p);
            ResultSet rs2=checkLogin.executeQuery();
            if(rs2.next()){
                return "login";
            }
            else{
                
                return "password";
            }
        
        }
        else{
            return "account";
        }
        
    }
    public String checkEmail(String e) throws SQLException{
        checkEmail.setString(1,e);
        ResultSet rs=checkEmail.executeQuery();
        if(rs.next()){
           return "Yes";
        }
        else{
            return "No";
        }
        
    }
    
    
    public HashMap getPublicDetails(String i) throws SQLException{
        getPublicDetails.setString(1,i);
        ResultSet rs=getPublicDetails.executeQuery();
        if(rs.next()){
            HashMap userDetails=new HashMap();
            userDetails.put("name", rs.getString("name"));
            userDetails.put("private", rs.getString("private"));
            userDetails.put("state", rs.getString("state"));
            userDetails.put("id", i);
            return userDetails;
        }
        else{
            return null;
        }
        
    }
    
    
    public HashMap getUserDetails(String e) throws SQLException{
        getUserDetails.setString(1,e);
        ResultSet rs=getUserDetails.executeQuery();
        if(rs.next()){
            HashMap userDetails=new HashMap();
            userDetails.put("id", rs.getString("id"));
            userDetails.put("name", rs.getString("name"));
            return userDetails;
        }
        else{
            return null;
        }
        
    }
    public HashMap getAllDetails(String id) throws SQLException{
        getAllDetails.setString(1, id);
        ResultSet rs=getAllDetails.executeQuery();
        if(rs.next()){
            HashMap allDetails=new HashMap();
            allDetails.put("number", rs.getString("number"));
            allDetails.put("dob",(java.sql.Date)rs.getDate("dob"));
            allDetails.put("gender", rs.getString("gender"));
            allDetails.put("blood", rs.getString("blood"));
            allDetails.put("state", rs.getString("state"));
            allDetails.put("city", rs.getString("city"));
            allDetails.put("pin_code", rs.getString("pin_code"));
            return allDetails;
        }
        else{
            return null;
        }
        
    }
    
    public String removeFollower(String id, String f_id) throws SQLException{
        
            removeFollower.setString(1, id);
            removeFollower.setString(2, f_id);
            
            int x=removeFollower.executeUpdate();
            if(x!=0)
                 return "no";
            else
                return "yes"; 
        
        
    }
    
    public String insertFollower(String id, String f_id) throws SQLException{
        
            insertFollower.setString(1, id);
            insertFollower.setString(2, f_id);
            
            int x=insertFollower.executeUpdate();
            if(x!=0)
                 return "yes";
            else
                return "no"; 
        
        
    }
    public String removeLike(String p_id, String id) throws SQLException{
        
            removeLike.setString(1, p_id);
            removeLike.setString(2, id);
            
            int x=removeLike.executeUpdate();
            if(x!=0)
                 return "no";
            else
                return "yes"; 
        
        
    }
    
    public String insertLike(String p_id, String id) throws SQLException{
        
            insertLike.setString(1, p_id);
            insertLike.setString(2, id);
            
            int x=insertLike.executeUpdate();
            if(x!=0)
                 return "yes";
            else
                return "no"; 
        
        
    }
    
    public String removeComments(String c_id) throws SQLException{
        
            removeComments.setString(1, c_id);
            
            int x=removeComments.executeUpdate();
            if(x!=0)
                 return "no";
            else
                return "yes"; 
        
        
    }
    
    public String insertComments(String p_id, String id, String text) throws SQLException{
        
            insertComments.setString(1, p_id);
            insertComments.setString(2, id);
            insertComments.setString(3, text);
            int x=insertComments.executeUpdate();
            
            String c_id="";
            if(x!=0){
                lastCommentId.setString(1, p_id);
                lastCommentId.setString(2, id);
                lastCommentId.setString(3, text);
                ResultSet rs=lastCommentId.executeQuery();
                while(rs.next()){
                    c_id=rs.getString("c_id");
                }
            }              
            else
                return "no"; 
         return c_id;
        
    }
    public java.util.ArrayList<java.util.HashMap> getComment(int p_id) throws SQLException{
        getMessage.setInt(1, p_id);
        ResultSet rs=getMessage.executeQuery();
        java.util.ArrayList<java.util.HashMap> allMessageMe=new java.util.ArrayList();
        while(rs.next()){
            java.util.HashMap message=new java.util.HashMap();
            message.put("text", rs.getString("text"));
            message.put("date", rs.getString("date"));
            message.put("m_id", rs.getString("m_id"));
            message.put("id", rs.getString("id"));
            allMessageMe.add(message);
        }
        return allMessageMe;
    }
    
    

}