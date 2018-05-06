package banco.entity;

import banco.entity.Usuario;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-06T17:09:56")
@StaticMetamodel(Movimiento.class)
public class Movimiento_ { 

    public static volatile SingularAttribute<Movimiento, Date> fecha;
    public static volatile SingularAttribute<Movimiento, String> tipo;
    public static volatile SingularAttribute<Movimiento, Integer> idMovimiento;
    public static volatile SingularAttribute<Movimiento, Usuario> usuarioidUsuario;
    public static volatile SingularAttribute<Movimiento, String> entidad;
    public static volatile SingularAttribute<Movimiento, String> concepto;
    public static volatile SingularAttribute<Movimiento, Double> cantidad;
    public static volatile SingularAttribute<Movimiento, Usuario> usuarioidUsuario1;

}