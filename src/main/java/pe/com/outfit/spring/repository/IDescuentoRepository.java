package pe.com.outfit.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import pe.com.outfit.spring.model.Descuento;

public interface IDescuentoRepository extends JpaRepository<Descuento, Integer>{
	@Query("from Descuento d where d.nombre like %:nombre%")
}
