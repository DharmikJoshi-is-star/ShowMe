package com.whatsapp.security;

public class SecureData {

    private String encryptString(String str) 
    { 
        int l = str.length(); 
        int k = 0, row, column; 
        
        double sq ;
        
        do{
        	sq = Math.sqrt(l);
        		
        	if((sq-Math.floor(sq)!=0))
        		l++;
        }while((sq-Math.floor(sq)!=0));
        
        row = (int)sq;
        column = (int)sq; 
  
        char s[][] = new char[row][column]; 
       
        for (int i = 0; i < row; i++)  
        { 
            for (int j = 0; j < column; j++)  
            { 
                if(k < str.length()) 
                    s[i][j] = str.charAt(k); 
                k++; 
            } 
        } 
  
        String encrptedString = "";
        for (int i = 0; i < column; i++)  
            for (int j = 0; j < column; j++) 
                encrptedString+= s[j][i];
        
        return encrptedString;
    } 
    
    private String decryptString(String str) 
    { 
    	 int l = str.length(); 
         int k = 0, row, column; 
         
         double sq ;
         
         do{
         	sq = Math.sqrt(l);
         	if((sq-Math.floor(sq)!=0))
         		l++;
         }while((sq-Math.floor(sq)!=0));
         
         row = (int)sq;
         column = (int)sq; 
  
        char s[][] = new char[row][column]; 
          
        for (int i = 0; i < row; i++)  
        { 
            for (int j = 0; j < column; j++)  
            { 
                if(k < str.length()) 
                    s[i][j] = str.charAt(k); 
                k++; 
            } 
        } 
  
        String decrptedString = "";
        for (int i = 0; i < row; i++)  
            for (int j = 0; j < column; j++) 
            	decrptedString+=s[j][i];
          
        return decrptedString;
    } 
	
	/*
    private String encryption(String str, Integer key){
		
		str = addExtraMessage(str,key);
		
		char[] charArray = str.toCharArray();
		char[] encrptedArray = new char[charArray.length];
		
		String encryptedString = "";
		
		for (int i = 0; i < charArray.length; i++) {
				
				int msg = (int)charArray[i];
				
				msg = msg + key;
				
				encrptedArray[i] = (char)msg;
				
				encryptedString+=(char)msg;
				
			}
	
		//return String.valueOf(encrptedArray);
		return encryptedString;
	}
	
	private String addExtraMessage(String message , Integer key){
		String newString = getRandomString(message, key)+message+getRandomString(message, key);
		return newString;
	}
	
	private String decryption(String str, Integer key){
		
		char[] charArray = str.toCharArray();
		char[] encrptedArray = new char[charArray.length];
		String decryptedString = "";
		
		for (int i = 0; i < charArray.length; i++) {
				int msg = (int)charArray[i];
				msg = msg - key;
				encrptedArray[i] = (char)msg;
				decryptedString+=(char)msg;
		}
		//String decryptedString = String.valueOf(encrptedArray);
		decryptedString = decryptedString.substring(0, decryptedString.length()-key);
		return decryptedString.substring(key);
	
	}
	*/
	public String encryptTheMessage(String msg) {
		return encryptString(msg);
	}
	
	public String decryptTheMessage(String msg) {
		return decryptString(msg);
	}
	
	public String encryptCredentials(String msg) {
		return encryptString(msg);
	}
}
