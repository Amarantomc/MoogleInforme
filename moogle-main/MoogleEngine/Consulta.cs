namespace MoogleEngine;
 public static class Consulta{
public static string [] busqueda;
    public static float [] idf;
    public static float[] score =new float[Matriz.ListDiccionariosTF.Count]; 
   public static Dictionary<float,string> Diccionariotfidf=new Dictionary<float,string>();
    public static string[] Docs=new string[3];
    public static string[] snippet=new string[3];
   
   public static void Modificar(string query){
        query=Load.EliminarTildes(query);
        query=Load.EliminarCaracteres(query);
        busqueda=new string[query.Length];
        busqueda=query.Split(" ",StringSplitOptions.RemoveEmptyEntries);
         }
      private static void SearchIdf(){
        
        float count=0;
       for(int i=0;i<busqueda.Length;i++){
        for(int j=0;j<Matriz.ListDiccionarios.Count;j++){
            if(Matriz.ListDiccionarios[j].ContainsKey(busqueda[i])){
               count++;
            }
        } 
            idf[i]*=Matriz.Idf((float)Matriz.ListDiccionarios.Count,(float)count);
            count=0;
             }
               }
      private static void TfIdf (){
       SearchIdf();
        float count=0;
         for(int i=0;i<Matriz.ListDiccionariosTF.Count;i++){
              for(int j=0;j<idf.Length;j++){
               if(Matriz.ListDiccionariosTF[i].ContainsKey(busqueda[j])){
                  count+=Matriz.ListDiccionariosTF[i][busqueda[j]]*idf[j];
               } 
              }
                score[i]=count;
                if(Diccionariotfidf.ContainsKey(count)){  
                  Diccionariotfidf[count]+="~~~"+Load.GetTitle()[i];
               
                } else {Diccionariotfidf.Add(count,Load.GetTitle()[i]);  }
            count=0;
              }
      }  
    
       public static void DocsResultantes(){
         TfIdf();
        Array.Sort(score);
        Array.Reverse(score);
        for(int i=0;i<Docs.Length;i++){
          string test="";
          if(Diccionariotfidf[score[i]].Contains("~~~")){
          test=Diccionariotfidf[score[i]];
             for(int j=0;j<test.Length;j++){
                if(test[j]=='~'){
                  test=test.Substring(0,j);
                  break;
                }
             } 
             Docs[i]=test;
             test="";
          } else Docs[i]=Diccionariotfidf[score[i]];
        }
      } 
       public static bool show(){
        if(score[0]==0){
          return true;
        } 
        return false;
       }
       public static void Importancia(string query){
        idf=new float[busqueda.Length];
      
        string[]result;
        result=query.Split(" ",StringSplitOptions.RemoveEmptyEntries);
        for(int i=0;i<result.Length;i++){
          idf[i]=(float)0.5;
        if(result[i].Contains("*")){
          int count=0;
          for(int j=0;j<result[i].Length;j++){
            
          if(result[i][j].Equals('*')){
              if(count>=2){
                count+=1;
              }else count+=2;
            } else break;
          } idf[i]=idf[i]*count;
            } 
       } 
       } 
       public static void Snippet(){
        string texto="";
        for(int i=0;i<Docs.Length;i++){
          for(int j=0;j<Load.GetPath().Length;j++){
            if(Load.GetPath()[j].Contains(Docs[i])){
              texto=File.ReadAllText(Load.GetPath()[j]);;
              if(texto.Length>150){
                 texto=texto.Substring(0,150);
              } snippet[i]=texto;
              break;
            }
          }  texto="";
        }
       }
    

 }
  