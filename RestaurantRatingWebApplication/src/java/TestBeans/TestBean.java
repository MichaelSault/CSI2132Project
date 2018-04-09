
package TestBeans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;


@Named(value = "testBean")
@SessionScoped
public class TestBean implements Serializable{
    private String title = "title";
    private List<String> list = new ArrayList<String>();
    private String content;
    
    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    
    public List<String> getList()
    {
        for (int i = 0; i < 10; ++i)
        {
            list.add(Integer.toString(i));
        }
        return list;
    }
    
    public void setList(List<String> list)
    {
        this.list = list;
    }
    
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    
}
