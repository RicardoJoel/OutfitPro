package pe.com.outfit.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import pe.com.outfit.spring.model.Asesor;

public interface IAsesorRepository extends JpaRepository<Asesor, Integer> {
	@Query("from Asesor order by Asesor.valoracion DESC")
}
