package ec.edu.espe.zonas.controllers;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Endpoint informativo del servicio. Usado por el pipeline CI/CD
 * como verificación de humo (smoke test) tras el despliegue.
 */
@RestController
@RequestMapping("/api/v1/info")
public class InfoController {

    @GetMapping
    public ResponseEntity<Map<String, String>> obtenerInfo() {
        Map<String, String> info = new LinkedHashMap<>();
        info.put("servicio", "zonas-backend");
        info.put("estado", "UP");
        info.put("pipeline", "DevSecOps CI/CD");
        return ResponseEntity.ok(info);
    }
}
