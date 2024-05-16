/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author yahya
 */
public class Intervention {
    private int code;
    private String machine;
    private String probleme;
    private int statut;
    private String codeDem;
    private String codeTech;
    
    // Constructor
    public Intervention() {
    }
    
    // Getters and setters
    public int getCode() {
        return code;
    }
    
    public void setCode(int code) {
        this.code = code;
    }
    
    public String getMachine() {
        return machine;
    }
    
    public void setMachine(String machine) {
        this.machine = machine;
    }
    
    public String getProbleme() {
        return probleme;
    }
    
    public void setProbleme(String probleme) {
        this.probleme = probleme;
    }
    
    public int getStatut() {
        return statut;
    }
    
    public void setStatut(int statut) {
        this.statut = statut;
    }
    
    public String getCodeDem() {
        return codeDem;
    }
    
    public void setCodeDem(String codeDem) {
        this.codeDem = codeDem;
    }
    
    public String getCodeTech() {
        return codeTech;
    }
    
    public void setCodeTech(String codeTech) {
        this.codeTech = codeTech;
    }
}

