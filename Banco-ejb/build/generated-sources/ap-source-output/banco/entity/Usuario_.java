package banco.entity;

import banco.entity.Movimiento;
import banco.entity.Usuario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-06T17:09:56")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> apellidos;
    public static volatile SingularAttribute<Usuario, Short> estado;
    public static volatile ListAttribute<Usuario, Usuario> usuarioList;
    public static volatile SingularAttribute<Usuario, Integer> idUsuario;
    public static volatile ListAttribute<Usuario, Movimiento> movimientoList;
    public static volatile ListAttribute<Usuario, Movimiento> movimientoList1;
    public static volatile SingularAttribute<Usuario, Double> saldo;
    public static volatile ListAttribute<Usuario, Usuario> usuarioList2;
    public static volatile SingularAttribute<Usuario, String> nombre;
    public static volatile ListAttribute<Usuario, Usuario> usuarioList1;
    public static volatile SingularAttribute<Usuario, String> domicilio;
    public static volatile SingularAttribute<Usuario, Short> empleado;
    public static volatile SingularAttribute<Usuario, Usuario> usuarioidUsuario;
    public static volatile SingularAttribute<Usuario, Integer> cuenta;
    public static volatile SingularAttribute<Usuario, String> contrasena;
    public static volatile SingularAttribute<Usuario, Integer> telefono;
    public static volatile SingularAttribute<Usuario, String> dni;
    public static volatile SingularAttribute<Usuario, String> email;

}