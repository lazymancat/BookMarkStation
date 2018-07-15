package com.ljm.web.staticFunc;

import java.io.File;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;

import java.math.BigInteger;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;


public class StaticFunc {
    private static String charSet = "0123456789abcdefghijklmnopqrstuvwxyz";
    private static String myEmailAccount = "lazymancat@163.com";
    private static String myEmailPassword = "DUxingZHE53886";
    private static String myEmailSMTPHost = "smtp.163.com";

    public static String getDate_YMD(){
    	Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        String dateNowStr = sdf.format(d);  
//        System.out.println("格式化后的日期：" + dateNowStr);  
        
        return dateNowStr;
    }
    
    /**
     * 获取验证码
     * @param length 验证码长度
     * @return
     */
    public static String getValiCode(int length) {
        String code = "";

        for (int i = 0; i < length; i++) {
            int pos = (int) (Math.random() * 36.0D);
            System.out.println(pos);
            code = code + charSet.substring(pos, pos + 1);
        }

        System.out.println(code);

        return code;
    }

    /**
     * 获取输入内容md5加密后的值
     * @param info 输入内容
     * @return
     */
    public static String getMD5(String info) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");

            md5.update(info.getBytes("UTF-8"));

            byte[] md5Array = md5.digest();

            return bytesToHex(md5Array);
        } catch (NoSuchAlgorithmException e) {
            return "";
        } catch (UnsupportedEncodingException e) {
        }

        return "";
    }

    /**
     * 128位md5码 转 32位16进制字符串
     * @param md5Array md5码
     * @return
     */
    public static String bytesToHex(byte[] md5Array) {
        BigInteger bigInt = new BigInteger(1, md5Array);

        return bigInt.toString(16);
    }

    /**
     * 发送邮件
     * @param receiveMailAccount 接受邮箱地址
     * @param sendMessage 发送的内容
     * @throws Exception
     */
    public static void sendMail(String receiveMailAccount, String sendMessage)
        throws Exception {
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");

        Session session = Session.getInstance(props);
        session.setDebug(true);

        MimeMessage message = createMimeMessage(session, myEmailAccount,
                receiveMailAccount, sendMessage);

        Transport transport = session.getTransport();

        transport.connect(myEmailAccount, myEmailPassword);

        transport.sendMessage(message, message.getAllRecipients());

        transport.close();
    }

    /**
     * 创建一封邮件
     * @param session
     * @param sendMail 发送的邮箱地址
     * @param receiveMail 接收的邮箱地址
     * @param sendMessage 发送的内容
     * @return
     * @throws Exception
     */
    public static MimeMessage createMimeMessage(Session session,
        String sendMail, String receiveMail, String sendMessage)
        throws Exception {
        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress(sendMail, "lazymancat", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO,
            new InternetAddress(receiveMail, "ljm", "UTF-8"));
        message.setSubject("个人书签管理网站 by lazymancat", "UTF-8");
        message.setContent(sendMessage, "text/html;charset=UTF-8");
        message.setSentDate(new Date());

        message.saveChanges();

        return message;
    }
    
}
