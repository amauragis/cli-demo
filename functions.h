// provides the definitons to build the syntax tree

#ifndef __EXPRESSION_H__
#define __EXPRESSION_H__

/**
 * @brief The operation type
 */
typedef enum EOperationType{
    eVALUE,
    eMULTIPLY,
    ePLUS
} EOperationType;

 /**
  * @brief The expression structure
  */
typedef struct SExpression{
    EOperationType type; // type of operation
    int value; // only valid when eVALUE is active
    struct SExpression* left; // left side of tree
    struct SExpression* right; // right side of tree
} SExpression;

/**
 * @brief Creates an identifier
 * @param value The number value
 * @return The expression or NULL if out of memory
 */
SExpression* createNumber(int value);

/**
 * @brief Creates an operation
 * @param type Operation type
 * @param left Left operand
 * @param right Right operand
 * @return The expression or NULL if out of memory
 */
 SExpression* createOperation(EOperationType type, SExpression* left, SExpression* right);

/**
 * @brief Deletes a expression
 * @param b The expression
 */
void deleteExpression(SExpression* b);
 
#endif // __EXPRESSION_H__
