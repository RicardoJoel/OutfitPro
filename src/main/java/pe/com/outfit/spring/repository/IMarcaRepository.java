package pe.com.outfit.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import pe.com.outfit.spring.model.Marca;

public interface IMarcaRepository extends JpaRepository<Marca, Integer>{
	@Query("from Marca m where m.nombre like %:nombre%")
}
