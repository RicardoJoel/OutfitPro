package pe.com.outfit.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import pe.com.outfit.spring.model.Talla;

public interface ITallaRepository extends JpaRepository<Talla, Integer>{
	@Query("from Talla t where t.nombre like %:nombre%")
}
