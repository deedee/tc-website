package com.topcoder.shared.problem;

import com.topcoder.shared.language.Language;

import com.topcoder.shared.netCommon.CustomSerializable;
import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.util.HashMap;

import java.io.IOException;
import java.io.ObjectStreamException;
import java.io.Serializable;

/**
 * A <code>DataType</code> represents a data type in a language-independent
 * manner.  This class has all the semantics of an <code>Element</code>.
 *
 * @see Element
 * @author  Logan Hanks
 */
public class DataType
    implements Element
{
    private HashMap typeMapping = new HashMap();
    private int id = -1;
    private String description = "";

    transient String baseName;
    transient int dim;

    /**
     * This is the default constructor, available for serialization.
     */
    public DataType()
    {
    }

    /**
     * A <code>DataType</code> consists of a numeric <code>id</code>
     * a description, and a mapping between language ids and
     * language-specific descriptors.
     * 
     * @param description   For example, <code>"String[]"</code> (pulled
     *                      from <code>data_type.data_type_desc</code>)
     */
    public DataType(String description)
    {
      this(-1, description, new HashMap());
    }

    /**
     * A <code>DataType</code> consists of a numeric <code>id</code>
     * a description, and a mapping between language ids and
     * language-specific descriptors.
     * 
     * @param id        A unique integer identifier (pulled from
     *                  <code>data_type.data_type_id</code>)
     * @param description   For example, <code>"String[]"</code> (pulled
     *                      from <code>data_type.data_type_desc</code>)
     */
    public DataType(int id, String description)
    {
        this(id, description, new HashMap());
    }

    /**
     * A <code>DataType</code> consists of a numeric <code>id</code>
     * a description, and a mapping between language ids and
     * language-specific descriptors.
     * 
     * @param id        A unique integer identifier (pulled from
     *                  <code>data_type.data_type_id</code>)
     * @param description   For example, <code>"String[]"</code> (pulled
     *                      from <code>data_type.data_type_desc</code>)
     * @param typeMapping   A <code>HashMap</code> containing all of the
     *                      language-&gt;descriptor mappings that are
     *                      defined for this data type.  Each mapping
     *                      is from <code>Integer</code> to <code>String</code>,
     *                      and should be populated with information obtained from the
     *                      <code>data_type_mapping</code> table.
     */
    public DataType(int id, String description, HashMap typeMapping)
    {
        this.id = id;
        this.description = description;
        this.typeMapping = typeMapping;
        parseDescription();
        DataTypeFactory.registerDataType(this);
    }

    public void setTypeMapping(HashMap typeMapping)
    {
        this.typeMapping = typeMapping;
    }

    public HashMap getTypeMapping()
    {
        return typeMapping;
    }

    public void customWriteObject(CSWriter writer)
        throws IOException
    {
        writer.writeInt(id);
        writer.writeString(description);
        writer.writeHashMap(typeMapping);
    }

    public void customReadObject(CSReader reader)
        throws IOException, ObjectStreamException
    {
        id = reader.readInt();
        description = reader.readString();
        typeMapping = reader.readHashMap();
        parseDescription();
        DataTypeFactory.registerDataType(this);
    }

    void parseDescription()
    {
        int x = description.indexOf('[');

        if(x == -1) {
            baseName = description;
            dim = 0;
            return;
        }
        baseName = description.substring(0, x);
        for(dim = 0; x != -1; dim++, x = description.indexOf('[', x + 1));
    }

    public String getDescription()
    {
        return description;
    }

    /**
     * The <code>getDescriptor</code> method generates a type descriptor
     * for this data type that is appropriate for the given language.
     *
     * @param  language  The language in which to present the type
     *                   descriptor.
     * @return A string reperesentation of the data type, presented in
     *         the given language.  If the descriptor for the given
     *         language is undefined (in the database), this method
     *         returns <code>null</code>.
     *
     * @see    Language
     */
    public String getDescriptor(Language language)
    {
        String desc = (String)typeMapping.get(new Integer(language.getId()));

        return desc == null ? getDescription() : desc;
    }
    public String getDescriptor(int id){
      String desc = (String)typeMapping.get(new Integer(id));
      return desc == null ? getDescription() : desc;
    }

    /**
     * The <i>base name</i> of a data type is the type of elements it ultimately contains
     * (regardless of dimensionality).  E.g., the base name of <code>String[][]</code>
     * is <code>String</code>.
     */
    public String getBaseName()
    {
        return baseName;
    }

    /**
     * The <i>dimensionality</i> of a data type refers to how many dimensions the type has.

     * 1, etc.  E.g., the dimensionality of <code>String[][]</code> is 2.
     */
    public int getDimension()
    {
        return dim;
    }

    /**
     * Constructs and returns a new type, similar to this type, but with its dimension reduced.
     *
     * @return A new <code>DataType</code> with the same base type as this one, but with a dimension of
     *         one less.
     * @throws InvalidTypeException if the dimension of this type is 0
     */
    public DataType reduceDimension()
        throws InvalidTypeException
    {
        StringBuffer buf = new StringBuffer(description);
        int i = description.indexOf("[]");

        if(i != -1)
            buf.delete(i, i + 2);
        else
            throw new InvalidTypeException("Attempt to reduce dimension of type " + description);
        return DataTypeFactory.getDataType(buf.toString());
    }

    public String toHTML(Language language)
    {
        String desc = getDescriptor(language);

        if(desc == null)
            return "null";
        return ProblemComponent.encodeHTML(desc);
    }

    public String toXML()
    {
        return "<type>" + ProblemComponent.encodeHTML(description) + "</type>";
    }

    /**
     * Returns true if <code>o</code> is a DataType with the same description
     * as <code>this</code>.
     */
    public boolean equals(Object o)
    {
      return (o != null) 
             && (o instanceof DataType) 
             && description.equals(((DataType)o).getDescription());
    }

    DataType cloneDataType()
    {
        try {
            return (DataType)clone();
        } catch(Exception ex) {
            return null;
        }
    }
    public int getID(){
        return id;
    }
}

