# Digital Image Processing

- **Captura**

    Es la muestra de una señal analogica en 2D.

- **Tipos de imagenes**
    
    - Renders
    
    - Binarias
    
    - Termales
    
    - Gases

- **Analisis de histogramas/Ecualizacion**

    Informacion de la distribucion de colores.

- **Segmentacion**

    - Mean-shift
    
    - Region growing

    - Watershed

    - Segmentation grafica

- **Transformaciones/Filtros/Fourier**

    - Cambio de espacios

    - Transformaciones afines

    - Kernels

    - Magnitud, fase

    - Filters

        - Low-pass, high-pass, band-pass filters

        - Enhancement filter

        - Mean filter

        - Gaussian filter

- **Deteccion de bordes/Points of interests/Gradientes**

    - Our own algo 
    
        - Suavizar
        
        - Gradiente
        
        - Morph operators
    
    - Canny
    
    - Image enhancement con gradientes 
    
        Adding constraste a partes homogeneas

    - Moravek

        Looks for the amount of change within a determined area

        - Fortalezas

            - Resistencia al ruido  

            - Detecta esquina y bordes

        - Debilidad

            - Detecta solo multiplos de 90 grados

            - No es escalable

- **Operadores morfologicos**. Over binary images

    - Thinning
    
    - Thickening
    
    - Open/close
    
    - Hit
    
    - Fit
    
    - Miss 

- **Composicion de imagenes**

    Image blending using pyramids.

- **Template matching**

    - There's an algorithm that finds images and movement of an image
    
    - Image enhancement using templates (pieces of pics)

        Selecting a patch by hand to repeat it in the reighboring zone.
        
        Once we find all the repeated patches, the zones have to be replaced by the median (mean?) of patches.

- **Imagenes satelitales**

    - Indices
    
        - NDWI $= \frac{b_1 - b_2}{b_1 + b_2}$
        
        - NDVI